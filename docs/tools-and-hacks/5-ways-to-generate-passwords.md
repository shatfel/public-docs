# 5 способов создания пароля

## Предисловие

В некоторых примерах используется код:

```zsh
for i in `seq 1 10`; do
  echo -n "${i}. "
  <код примера>
  done
```

Данный кусок лишь для примера генерации нескольких паролей - обычно 10.

## Способ №1

```zsh
openssl rand –base64 <pass-len-1>
```

### Примеры

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

### Примеры

```zsh
for i in `seq 1 10`; do echo -n "$i. "; < /dev/urandom tr -dc A-Za-z0-9 | head -c$i; echo; done
```

```zsh
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

### Примеры

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

> P.S. Ключик `-s` "типа" для более тщательной (как бюджет РФ, ога)))) выборки генератора. Хз, работает али нет.

## Способ №4

```zsh
gpg --gen-random --armor 1 *<count>
```

### Примеры

```zsh
% for i in `seq 1 10`; do echo -n "$i. " ; gpg --gen-random --armor 1 14; done
```

```
1. 4l3bw8BjqFbSyUBvb8A=
2. LXr//e2szxZZ2tRGPnM=
3. CL5lwLnIUM/hzrz/+/Q=
4. E9Yx6va94ULlQhGuKRU=
5. wZa4ixDE8luw+1B2Nbw=
6. oHTdvqh7eSwTkCC7cvE=
7. 5KENULLGug1XL3u9ixk=
8. PUueNi2BoCP+iUrlNIM=
9. eHt/eN+mPEfTJ1SaDtQ=
10. usdWww+Uh+kXqy5ztOk
```

## Способ №5

```zsh
apg -n<count> -m<minlen> -x<maxlen>
```

### Примеры

```
% apg -n 10 -m8 -x14
```

```
jeducnunBacEuj  
IrdAystomciko  
RhookOdGaut2  
covtaryeypyen  
mykAkvik  
DuzThegEgNik~  
Ar`Vimpeugilno  
TrijDeofeeFref  
AkPihainn  
gojyocKegbie
```