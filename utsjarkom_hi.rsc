# nov/06/2024 15:07:20 by RouterOS 6.49.11
# software id = SUX5-3H8X
#
# model = RB941-2nD
# serial number = HG109WYFYW6
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface ipip
add local-address=10.60.6.152 name=ipip-tunnel1-KHI-CR remote-address=\
    10.60.6.150
add local-address=10.60.6.152 name=ipip-tunnel2-KHI-KJ remote-address=\
    10.60.6.151
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.30.2-192.168.30.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether2 name=dhcp1
/ip address
add address=192.168.30.1/24 interface=ether2 network=192.168.30.0
add address=10.208.20.2 interface=ipip-tunnel1-KHI-CR network=10.208.20.1
add address=10.208.30.2 interface=ipip-tunnel2-KHI-KJ network=10.208.30.1
/ip dhcp-client
add disabled=no interface=ether1
/ip dhcp-server network
add address=192.168.30.0/24 gateway=192.168.30.1
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
/ip route
add distance=1 dst-address=192.168.10.0/24 gateway=10.208.20.1
add distance=1 dst-address=192.168.20.0/24 gateway=10.208.30.1
/system clock
set time-zone-name=Asia/Jakarta
