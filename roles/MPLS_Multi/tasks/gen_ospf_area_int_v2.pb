---
- name: Task to run script that generates ospf_areas.yml
  script: scripts/ospf_gen_v2.py {{ vendor }} "{{ hostvar_dir }}/interface.yml" "{{ hostvar_dir }}/" '{{ int_prefix }}'
