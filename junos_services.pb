---
- name: JUNOS Services configuration playbook
  hosts: "{{ hostname }}"
  connection: local
  gather_facts: no

  tasks:
  - name: Applying Services config
    junos_config:
      src: '{{ services_dir }}/{{ inventory_hostname }}_services.conf'
      update: merge
      comment: "{{ comment if comment is defined else 'SERVICES commit by Ansible'}}"
