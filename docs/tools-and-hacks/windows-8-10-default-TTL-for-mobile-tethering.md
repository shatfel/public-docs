# Настройка default ttl для Windows 8-10, чтобы раздавать Инет с телефона

- [Настройка default ttl для Windows 8-10, чтобы раздавать Инет с телефона](#настройка-default-ttl-для-windows-8-10-чтобы-раздавать-инет-с-телефона)
  - [Что необходимо??](#что-необходимо)
  - [Что в файлах??](#что-в-файлах)
  - [Установка](#установка)
  - [Проблемы](#проблемы)
  - [Linux](#linux)

## Что необходимо??

1. ПК с Windows 8-10

2. Телефон со шнурком/hotspot

3. Файлы [отсюда](/files/win-default-ttl)

4. Как всегда - двойной анальный форсаж, ибо Венда))

## Что в файлах??

**default-ttl-ipv4.reg**

```
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters]
"DefaultTTL"=dword:00000080
```

**default-ttl-ipv6.reg**

```
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters]
"DefaultTTL"=dword:00000080
```

Просто ставим десятичное 128.

## Установка

1. Добавляем руками или через запуск файлов параметры.

2. Вставляем шнурок или включаем hotspot

3. Подключаемся

## Проблемы

Иногда всё же придется на телефоне (с root) править TTL Master`ом или аналогом. Причём ставить когда 63, а когда 64 ttl на телефоне.

## Linux

Для Linux смотреть [тут](/docs/tools-and-hacks/linux-TTL-for-mobile-tethering.md).