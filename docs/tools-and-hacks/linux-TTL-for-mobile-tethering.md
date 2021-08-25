# Настройка default ttl для Windows 8-10, чтобы раздавать Инет с телефона

- [Настройка default ttl для Windows 8-10, чтобы раздавать Инет с телефона](#настройка-default-ttl-для-windows-8-10-чтобы-раздавать-инет-с-телефона)
  - [Что необходимо??](#что-необходимо)
  - [Установка](#установка)
  - [Windows](#windows)

## Что необходимо??

1. ПК с Linux

2. Телефон со шнурком/hotspot

## Установка

1. Вставляем шнурок или включаем hotspot

2. Подключаемся

3. `dhclient usb0` или `dhclient wlan0`

4. `iptables -t mangle -A PREROUTING -j TTL --ttl-set 63`, где 63 из расчёта TTL телефона -1 до -10 (53-63 ttl).

## Windows

Для Windows смотреть [тут](/docs/tools-and-hacks/windows-8-10-default-TTL-for-mobile-tethering.md)