---
- name: JNPR roles
  hosts: JNPR
  connection: local
  gather_facts: no

  roles:
    - JNPR
