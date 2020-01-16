---
- name: SROS Create Rollback point playbook
  hosts: "{{ hostname }}"
  gather_facts: no

  tasks:
  - name: Create a rollback point before applying config
    sros_command:
      commands:
        - admin rollback save comment "{{ comment if comment is defined else 'Before Ansible Config'}}"
    #action: "{{ command_module }} commands={{ cmd }}"
