# 8 способов создания пароля

## Content

1. [Способ №1](#способ-1) ([Примеры](#примеры-1))
2. [Способ №2](#способ-2) ([Примеры](#примеры-2))

## Способ №1

```
openssl rand –base64 <pass-len-1>
```

### Примеры №1:

```zsh
 % for i in `seq 1 10`; do echo -n "$i. "; openssl rand -base64 $i; done
```

```
1. 2A==
2. Ues=
3. /ZFT
4. 2N1XhQ==
5. vkNAdWw=
6. RfRVF+Nx
7. KO8UKWz3MA==
8. 9TPiHWp0aMw=
9. Cz7daM5yYdqh
10. jMikakJvJGPq0w==
```

## Способ №2

```
< /dev/urandom tr -dc A-Za-z0-9 | head -c$i; echo
```

### Примеры №2:

```zsh
for i in `seq 1 10`; do echo -n "$i. "; < /dev/urandom tr -dc A-Za-z0-9 | head -c$i; echo; done
```

```
1. w
1. sw
2. hPI
3. pViB
4. kcmR9
5. b51Wvi
6. FqpAVlk
7. WBkK29PD
8. bhHX4wlMG
9.  bgiB3tjErk
```