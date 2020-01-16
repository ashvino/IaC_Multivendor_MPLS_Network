---
- name: Generate core_interface.yml variable for hosts
#    template: src="vagnostic_gen_core_interface.j2" dest="{{ hostvar_dir }}/core_interfaces.yml"
  template: src="vagnostic_gen_core_interface.j2" dest="{{ hostvar_dir }}/core_interfaces.yml"
