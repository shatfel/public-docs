# Git: работа с двумя копиямы репы

## Добавление второй репы

## Push сразу в обе

```shell
git remote set-url --add --push <repo name> <repo url>
```

## Или второй вариант

Добавить репе в `.git/config`:

```shell
[remote "all"]
	url = <копируем из основного origin>
	pushurl = <url первого>
	pushurl = <url второго>
```

И далее `git push all`.