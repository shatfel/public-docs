# 8 способов создания пароля

## Contents

1. [Способ №1](#способ-1) ([Примеры](#примеры-1))
2. [Способ №2](#способ-2) ([Примеры](#примеры-2))
3. [Способ №3](#способ-3) ([Примеры](#примеры-3))

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

## Способ №3

```zsh
pwgen  -s <len> <count>
```

### Примеры №3

Если просто запустить, как указано, то выходит не очень правильно, если надо построчно:

```zsh
% pwgen 14 10
```

```zsh
eek3AHiezi9Aig ooheuThaiSh1Ha eiheilongi3Xie ae7eiqu1kooT4W thaich1Cha6ain
Beifahch0Aedai Iez4Eighie3Aec choo3Ahpeeghee ohxohn5ous3Aec yae4jeiChei3Le
```

Потому для лучшего эффекта:

```zsh
% pwgen -s 14 10 | tr ' ' '\n'
```

```zsh
Mn56Ar1dl8Bxtw  
62MlMemO07Yhsn  
LJSk45S0Y2CjSV  
91nEktKyCSv84F  
CL9VGlFxEMNSwQ  
oE0XtfBsfQC93r  
mHtOrc9CbVojF1  
xuzBNoVkYnGu0H  
HyYqtELb7Mxe2z  
y2kQLTcprSHXfb  
VRVOWouq3N3jaE  
Cb2yZ1KQ2b956H  
IkwE1i48hixdUt  
8mYnD7XMFRdH76  
bYCHQrogPSI7Vm  
rJMfpJVw4T6LDY  
ZKdtNAuuFc3DQL  
HuedtYuOe9B0Cy  
c5MupERzrmbaTl  
4leHvQCDyxcTu4  
6mEKJNViu9Wtwa  
4rQ0zq04z0CbbJ  
```