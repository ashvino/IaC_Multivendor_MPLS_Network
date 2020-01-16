---
- name: SROS Rollback configuration
  hosts: "{{ hostname }}"
  gather_facts: no

  tasks:

  - name: Configure rollback location
    sros_rollback:
      rollback_location: "cf3:/rollback-file"
