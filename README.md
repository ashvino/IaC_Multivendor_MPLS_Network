# IaC_Multivendor_MPLS_Network
Infrastructure/Network as Code for a Multivendor IP-MPLS Service Provider Network comprising of following vendor devices/OS:

1. Cisco IOSXR
2. Juniper JUNOS
3. Nokia SROS

Ansible and jinja templates are used for configuration generation for each device defined in hosts file.

# Example Network Topology

![Example Topolgy](images/topology.png)

Example topology includes P & PE routers and BGP route-reflectors. 
The templates only consist of configuration for the Transport network:

1. RSVP full-mesh between P routers
2. LDP between PE & P routers
3. LDPoRSVP tunneling
4. IGP: OSPF multi-area
5. MP-BGP control plane



