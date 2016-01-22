require 'spec_helper'

describe "Filebeat setup" do

  describe package('filebeat') do
    it { should be_installed }
  end

  describe file('/etc/filebeat/filebeat.yml') do
    it { should be_file }
    its(:content) {
      should include("hosts: [\"#{ANSIBLE_VARS.fetch('filebeat_logstash_server', 'FAIL')}:#{ANSIBLE_VARS.fetch('filebeat_logstash_server_port', 'FAIL')}\"]")
    }
# TODO: fix formatting of this result string first
#    its(:content) {
#      should include("prospectors: #{ANSIBLE_VARS.fetch('filebeat_prospectors', { fail: 'fail' }).to_yaml}")
#    }
  end

  describe service('filebeat') do
    it { should be_enabled }
    it { should be_running }
  end
end
