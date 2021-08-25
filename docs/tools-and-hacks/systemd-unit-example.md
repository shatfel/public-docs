# Пример systemd unit (возможо нужно править)

- [Пример systemd unit (возможо нужно править)](#пример-systemd-unit-возможо-нужно-править)
  - [Цель](#цель)
  - [Теория](#теория)
  - [Пример unit-файла (сразу нормальный)](#пример-unit-файла-сразу-нормальный)

## Цель

Написать постой unit-файл для запуска нашего внешнего скрипта или ПО.

## Теория

Место нахождения unit-файлов:
1. `/usr/lib/systemd/system` *(система)*
2. `/run/systemd/system` *(динамически созаваемые)*
3. `/etc/systemd/system` *(административные) - то, что нам надо!!!*

Минимальные разделы, которые должны быть в unit-файле: `Unit`, `Service`, `Install`.

## Пример unit-файла (сразу нормальный)

Напишем простой шаблон для запуска некоего демона `someDaemon`, обслужиающего наш движок сайта. Демон должен быть запущен (что логично, не так ли??) после web-сервера - у меня nginx. Для большей гибкости включим настройки окружения запуска - `EnvironmentFile`. Соответственно сам unit-файл закинуть в  [`/etc/systemd/system/someDaemon.service`](/files/systemd-unit-example/someDaemon.service).

```sh
[Unit]
Description=Run some software
##Documentation=man:???
After=nginx.target
Wants=nginx.target

[Service]
Type=notify
EnvironmentFile=/etc/someDaemon.conf
##EnvironmentFile=/var/www/html/site1/config.conf
ExecStart=${someDaemonStartScript}
Restart=always
RestartSec=${someDaemonRestartTimeout}

[Install]
WantedBy=multi-user.target
```

Срхраняем в `/etc/systemd/system/someDaemon.service`. Пишем дальше `/etc/someDaemon.conf`:

```sh

```