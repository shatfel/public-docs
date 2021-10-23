# pf.conf (не совсем minimal, но soso))) [хер там, не успел, жритеЧтоДают]

+ [pf.conf (не совсем minimal, но soso)))](#pfconf-не-совсем-minimal-но-soso)
  + [Цель](#цель)
  + [По частям (см #)](#по-частям-см-)
    + [Макросы](#макросы)
    + [Таблицы](#таблицы)
    + [Опции](#опции)
    + [Скраб](#скраб)
    + [Правила](#правила)
  + [/usr/local/etc/pf/src-allowed](#usrlocaletcpfsrc-allowed)
  + [Всё вместе (ой, бля, ctrl+ins/shift+ins)](#всё-вместе-ой-бля-ctrlinsshiftins)

## Цель

По сути - просто собрать всё вместе.

**Плюс** - всё ж наконец допилить что-то мин для *VPS/VDS* на *Open/FreeBSD*

## По частям (см #[Всё-вместе-(ой,-бля,-ctrl+ins/shift+ins](#всё-вместе-ой-бля-ctrlinsshiftins))

### Макросы

```
## 
### INTERFACES
##

## external interfaces
## wan0
wanIF0 = "wan0"
wanIf0Address = "172.16.66.254"
## wan netmask
wanIf0Mask = "24"

## internal interfaces
## vpx0
intIf0 = "vpx0"
intIf0Address = "172.16.254.254"
intIf0Mask = "24"

## tap0
iftIf1 = "tap0"
intIf1Address = "10.0.0.254"
intIf1Mask = "24"



##
### PORT FILTERS
##

## tcp port list allowed
tcpPortsAllowed = "22 80 443"

## upd port list allowed
udpPortsAllowed = "53 5353 5553 853"
```

### Таблицы

```
##
### TABLES
##

## allowed nets and address
table <srcAllowed> persist file "/usr/local/etc/pf/src-allowed"
```

### Опции

```
##
### OPTIONS
##

set skip on lo0
```

### Скраб

```
##
### scrub
##

scrub in all
```

### Правила

```
## block all
block in all

## allow ports
pass in proto tcp to ports { $tcpPortsAllowed, $udpPortsAllowed }

## allow out from wan0
pass out on $wanIf0 
```

## /usr/local/etc/pf/src-allowed

```
127.0.0.1
172.16.0.0/24
172.16.66.0/24
```

## Всё вместе (ой, бля, ctrl+ins/shift+ins)

```
## 
### INTERFACES
##

## external interfaces
## wan0
  wanIf0 = "wan0"
  wanIf0Address = "172.16.66.254"
## wan netmask
  wanIf0Mask = "24"

## internal interfaces
## vpx0
  intIf0 = "vpx0"
  intIf0Address = "172.16.254.254"
  intIf0Mask = "24"

## tap0
  intIf1 = "tap0"
  intIf1Address = "10.0.0.254"
  intIf1Mask = "24"



##
### PORT FILTERS
##

## tcp port list allowed
  tcpPortsAllowed = "22 80 443"

## upd port list allowed
  udpPortsAllowed = "53 5353 5553 853"

##
### TABLES
##

## allowed nets and address
  table <srcAllowed> persist file "/usr/local/etc/pf/src-allowed"

##
### OPTIONS
##

  set skip on lo0

##
### scrub
##

  scrub in all

## block all
  block in all

## allow ports
  pass in proto tcp to port { $tcpPortsAllowed }
  pass in proto udp to port { $udpPortsAllowed }

## allow out from wan0
  pass out on $wanIf0 

## pass dns only on others (just cuz I can :P))
##pass out on { $intIf0, $intIf1 } proto udp from any to any port dns
## if u oldfag as me do it then
pass out on { $intIf0, $intIf1 } proto udp from any to any port 53

```
