---
- name: Purge and delete any previous config_dir
  file: path={{ config_dir }} state=absent
