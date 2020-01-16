---
- name: JUNOS IaC config
  hosts: "{{ hostname }}"
  connection: local
  gather_facts: no

  tasks:
  - name: Check if NETCONF enabled & enable if not
    junos_netconf:
      listens_on: 830
      state: present

  - name: Applying {{ vendor|upper }} core config
    junos_config:
      src: '{{ config_dir }}/{{ inventory_hostname }}_complete.conf'
      update: replace
      comment: "{{ comment if comment is defined else 'CORE commit by Ansible'}}"
