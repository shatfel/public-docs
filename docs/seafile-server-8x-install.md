# How to install SeaFile server 8.x

1. get tar.gz
2. mkdir /opt/sf
3. unpack tar.gz to /opt/sf
4.  apt install python2.7 libpython2.7 python-setuptools python3-ldap python3-urllib3 sqlite3 -y
5. cd /opt/sf/seafile-server-*.* && ./setup-seafile.sh
6. Do all steps
7. create ./start

```zsh
#!/usr/bin/env zsh

alias python=python3

./seafile.sh $1
./seahub.sh $1
```

8. Suck a dick, devs.