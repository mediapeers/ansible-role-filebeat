# Ansible role to install & configure filebeat
Ansible role that installs filebeat on Linux using the apt package elastic provides.

Also sets up the filebeat.yml config file based on role parameters.

## Requirements
Debian based Linux, tested on Ubuntu.

## Role Variables
```yaml
# List of files to read logs from:
filebeat_logfiles:
  - /var/log/syslog
  - /var/log/*/*.log
  - /opt/my_app/log/production.log
# Logstash server to send logs to:
filebeat_logstash_server: 'logstash.server.com'
filebeat_logstash_server_port: 5044
```

## Dependencies
This role has no dependencies to other roles.

## Example Playbook
This is how you can include this role in your existing playbook:
```yaml
- name: My nice play
  hosts: servers
  vars:
    - filebeat_logstash_server: 'logstash.my.server'
    - filebeat_logstash_server_port: 5044
    - filebeat_logfiles:
      - /var/log/syslog
  roles:
    - mpx.filebeat
```

## License
BSD

## Author Information
Stefan Horning <horning[-at-]mediapeers.com>
