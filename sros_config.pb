---
- import_playbook: sros_rollback_config.pb
- import_playbook: sros_rollback_point.pb

- name: SROS Playbook to apply Core config
  hosts: "{{ hostname }}"
  gather_facts: no
#  vars:
#    comment: "Before core config"
  
#  vars:
#    cli:
#      host: "{{ inventory_hostname }}"
#      username: admin
#      password: admin

  tasks:
#  - sros_config:
#      src: "{{ config_dir }}/{{ inventory_hostname }}_flat_complete.conf"
#      provider: "{{ cli }}"
#      save: yes

  - name: Applying config
    action: "{{ config_module }} src='{{ config_dir }}/{{ inventory_hostname }}_flat_complete.conf' save=yes"
