# pf.conf (minimal)

```conf
## /etc/pf.conf
## pf config
## after change run pfctl -f /etc/pf.conf

## scrubbing
scrub in all

## block all
block in  all

## allow some tcp
pass in proto tcp to port { 22 80 443 }

## allow some udp
pass in proto udp to port { 53 5353 853 }

## allow out all
pass out proto { tcp udp }

## yup its minimal :P
```
