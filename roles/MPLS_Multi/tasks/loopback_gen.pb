---
#- name: Generate loopback IPs
#  hosts: localhost
#  connection: local
#  gather_facts: no  

#  tasks:
- name: "Generate loopback IDs and store in host_vars/loopback.yml"
  template: src="loopback_id.j2" dest="{{ base_dir }}/host_vars/{{ inventory_hostname }}/loopback.yml"

- include_vars:
    dir: "{{ hostvar_dir }}"
    extensions: [yml]

- include_vars:
    dir: "{{ base_dir }}/group_vars/MPLS_Multi"
    extensions: [yml]

- name: "Generate loopback addr and store in group_vars/loopback.yml"
  template: src="loopback.j2" dest="{{ base_dir }}/group_vars/MPLS_Multi/all_loopbacks.yml"
