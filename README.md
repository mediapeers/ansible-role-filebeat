[![Build Status](https://travis-ci.org/mediapeers/ansible-role-filebeat.svg?branch=master)](https://travis-ci.org/mediapeers/ansible-role-filebeat)

# Ansible role to install & configure filebeat
Ansible role that installs filebeat on Linux using the apt package elastic provides.

Also sets up the filebeat.yml config file based on role parameters.
This role ist mostly designed to setup filebeat for collection of logfile content and sending 
it on to logstash. If you want other outputters you might have to change a bunch of things first!

## Requirements
Debian based Linux, tested on Ubuntu. Recent version of Ansible. Only utilized Ansible core modules.

## Role Variables
```yaml
# List of files to read logs from:
filebeat_prospectors:
  - { paths: /var/log/*/*.log, input_type: log, document_type: log}

# Logstash server to send logs to:
filebeat_logstash_server: 'logstash.server.com'
filebeat_logstash_server_port: 5044
filebeat_logstash_tls: false
filebeat_logstash_tls_certificate_authorities: []
filebeat_logstash_tls_certificate:
filebeat_logstash_tls_certificate_key:
filebeat_logstash_tls_insecure: false
```

You can also define variable `filebeat_extra_prospectors` on a per-host or
per-group basis.  This variable is concatenated with `filebeat_prospectors`
when rendering the configuration template.


## Dependencies
This role has no dependencies to other roles.

## Example Playbook
Copy this role into the roles/mediapeers.filebeat dir in your Ansible project. Preferably add it as a submodule.
You can also install it with `ansible-galaxy install mediapeers.filebeat`.
Then use it like so:

```yaml
- name: My nice play
  hosts: servers
  vars:
    - filebeat_logstash_server: 'logstash.my.server'
    - filebeat_logstash_server_port: 5044
    - filebeat_logfiles:
      - /var/log/syslog
  roles:
    - mediapeers.filebeat
```

## License
BSD

## Author Information
Stefan Horning <horning[-at-]mediapeers.com>
