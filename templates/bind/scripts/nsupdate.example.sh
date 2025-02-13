#!/bin/sh

nsupdate -k "{{ dns_bind_keys_dir }}/{{ dns_bind_local_key }}" << EOF
server localhost
zone {{ dns_bind_local_zone_label }}
update delete test.{{ dns_bind_local_zone_label }} A
update add test.{{ dns_bind_local_zone_label }} 3600 A 192.168.0.111
send
EOF
