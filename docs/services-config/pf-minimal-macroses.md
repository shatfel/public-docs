# pf.conf (minimal + macroses)


```conf
## /etc/pf.conf
## pf config
## after change run pfctl -f /etc/pf.conf

## macroses
tcpPortsAllowed = "22 80 443"
udpPortsAllowed = "53 5353 853"

## scrubbing
scrub in all

## block all
block in  all

## allow some tcp
pass in proto tcp to port  {$tcpPortsAllowed}

## allow some udp
pass in proto udp to port {$udpPortsAllowed}

## allow out all
pass out proto { tcp udp }

## yup its minimal :P
```
