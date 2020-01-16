---
- name: MPLS_Multi roles
  hosts: MPLS_Multi
  connection: local
  gather_facts: no

  roles:
    - MPLS_Multi
