---
- name: SROS Services configuration playbook
  hosts: "{{ hostname }}"
  gather_facts: no

  tasks:
  - name: Create a rollback point before applying config
    sros_command:
      commands:
        - admin rollback save comment "Before Ansible Commit"
    #action: "{{ command_module }} commands={{ cmd }}"
