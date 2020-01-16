---
#- import_playbook: sros_rollback_config.pb
#- import_playbook: sros_rollback_point.pb

- name: SROS playbook to flatten config files
  hosts: "{{ hostname }}"
  gather_facts: no

  tasks:
  - name: Generate flat sros config file from services config
    script: "{{ base_dir }}/scripts/sros_to_flat.py {{ services_dir }}/{{inventory_hostname}}_services.conf > {{ services_dir }}/{{inventory_hostname}}_flat_services.conf"

