---
- name: CSCO roles
  hosts: CSCO
  connection: local
  gather_facts: no

  roles:
    - CSCO
