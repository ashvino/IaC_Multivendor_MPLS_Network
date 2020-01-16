---
- import_playbook: sros_rollback_config.pb
- import_playbook: sros_rollback_point.pb
- import_playbook: sros_services_flat.pb

- name: SROS Services configuration playbook
  hosts: "{{ hostname }}"
  gather_facts: no

  tasks:
  - name: Applying services config
    action: "{{ config_module }} src='{{ services_dir }}/{{ inventory_hostname }}_flat_services.conf' save=yes"
