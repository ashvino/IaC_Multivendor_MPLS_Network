#!/usr/bin/env python3
import sys
import yaml
import time
import argparse
import json
import re

interface_file = sys.argv[2]
interface_yml = open(interface_file, 'r')
interface = yaml.load(interface_yml.read())

dst_dir = sys.argv[3]

vendor = sys.argv[1]
int_p_origin = sys.argv[4]
#int_prefix = json.loads(int_p)
#int_prefix = dict(int_p)

print(int_p_origin)

int_p = re.sub("}", '"}', re.sub("{u", '{"', re.sub(",", '",',re.sub(":", '":', re.sub("\su", '"', int_p_origin)))))
int_prefix = json.loads(int_p)

ospf_data = {"ospf":{"area":{}}}

def populate_ospf(data, ifl):
    if "ospf" in data:
        area = data['ospf']['area']
        ospf_new = ospf_data["ospf"]["area"]
        if area not in ospf_new:
            ospf_new.update({area:{"interface":{}}})
        if ifl not in ospf_new[area]['interface']:
            ospf_new[area]['interface'].update({ifl:{}})

        ospf_ifl = ospf_new[area]['interface'][ifl]

        #for param_type, param_data in data['ospf'].items():
        #    if param_type != "area":
                #param_data = data['ospf'][param_type]
                #print(param_type, param_data)
        #        ospf_ifl.update({param_type: param_data})
        ospf_ifl.update({param_type: param_data for param_type, param_data in data['ospf'].items() if param_type != "area" })


def main():
    print(int_prefix)
    for lcnum in interface['interfaces']['linecard']:
        for slotnum in interface['interfaces']['linecard'][lcnum]['slot']:
            for portnum in interface['interfaces']['linecard'][lcnum]['slot'][slotnum]['port']:
                phy = interface['interfaces']['linecard'][lcnum]['slot'][slotnum]['port']
                #int_type = "Gi0/" if vendor == "cisco" else "ge-" if vendor == "juniper" else ""
                phy_type = phy[portnum]['phy']
#                if vendor != "alcatel-lucent":
#                    vendor_int_type = int_prefix[phy_type]
                vendor_int_type = int_prefix[phy_type] if vendor == "cisco" or vendor == "juniper" else ""
                ifd = str(vendor_int_type) + str(lcnum) + str("/") + str(slotnum) + str("/") + str(portnum)

                if "units" in phy[portnum]:
                    for unit in phy[portnum]['units']:
                        if vendor == "alcatel-lucent":
                            ifl = str(unit['function']) + str("_") + str(unit['neighbor'])
                        else:
                            ifl = str(ifd) + str(".") + str(unit['id'])
                        populate_ospf(unit, ifl)

            #elif "ospf" in phy[portnum]:
                else:
                    if vendor == "alcatel-lucent":
                        ifl = str(phy[portnum]['function']) + str("_") + str(phy[portnum]['neighbor'])
                    elif vendor == "juniper":
                        ifl = str(ifd) + str(".0")
                    else:
                        ifl = str(ifd)
                    populate_ospf(phy[portnum], ifl)


    print("--- YAML Format ----")
    print(yaml.dump(ospf_data, default_flow_style=False))

    now = time.strftime("%c")
    dst_file = str(dst_dir) + str("ospf_areas.yml")
    with open(dst_file, 'w') as fw:
        header = str("# Generated from Python script @ ") + str(". Any changes to this file will be overwritten on next run of Playbooks/Script\n")
        fw.write(header)
        fw.write(yaml.dump(ospf_data, default_flow_style=False))


interface_yml.close()

if __name__ == "__main__":
    main()
