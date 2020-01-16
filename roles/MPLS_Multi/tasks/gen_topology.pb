---
- name: Generate topo.yml [ Topology file in yaml format ]
#  hosts: localhost

#  tasks:
  template: src='gen_topology.j2' dest='{{ base_dir }}/group_vars/MPLS_Multi/topo.yml'
#  - template: src='gen_topology.j2' dest='/tmp/Ansible_Test/Multi-MPLS/draft/topo.yml'
