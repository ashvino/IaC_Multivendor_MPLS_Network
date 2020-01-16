---
- name: ALU roles
  hosts: ALU
  connection: local
  gather_facts: no

  roles:
    - ALU
