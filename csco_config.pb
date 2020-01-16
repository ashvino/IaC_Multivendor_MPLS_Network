---
- name: CSCO IaC config
  hosts: "{{ hostname }}"
  connection: local
  gather_facts: no

  tasks:
  - name: Applying CISCO IOSXR core config
    iosxr_config:
      src: '{{ config_dir }}/{{ inventory_hostname }}_complete.conf'
      replace: config
      backup: yes
      comment: "{{ comment if comment is defined else 'CORE commit by Ansible'}}"
