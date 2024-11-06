# nov/06/2024 14:55:13 by RouterOS 6.49.10
# software id = N3QS-6CS2
#
# model = RB941-2nD
# serial number = HF8099MJW59
/interface wireless
set [ find default-name=wlan1 ] ssid=MikroTik
/interface ipip
add local-address=10.60.6.151 name=ipip-tunnel1-KJ-CR remote-address=\
    10.60.6.150
add local-address=10.60.6.151 name=ipip-tunnel2-KJ-KHI remote-address=\
    10.60.6.152
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=dhcp_pool0 ranges=192.168.20.2-192.168.20.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether2 name=dhcp1
/ip address
add address=192.168.20.1/24 interface=ether2 network=192.168.20.0
add address=10.208.10.2 interface=ipip-tunnel1-KJ-CR network=10.208.10.1
add address=10.208.30.1 interface=ipip-tunnel2-KJ-KHI network=10.208.30.2
/ip dhcp-client
add disabled=no interface=ether1
/ip dhcp-server network
add address=192.168.20.0/24 gateway=192.168.20.1
/ip route
add distance=1 dst-address=192.168.10.0/24 gateway=10.208.10.1
add distance=1 dst-address=192.168.30.0/24 gateway=10.208.30.2
/system clock
set time-zone-name=Asia/Jakarta
