
# Домашнее задание к занятию «Язык Python. Основы.»

В качестве результата пришлите ответы на вопросы в личном кабинете студента на сайте [netology.ru](https://netology.ru/).

**Важно**: перед отправкой переименуйте ваш скрипт в `script.txt` (система отправки файлов Netology блокирует файлы с расширением `.py`).



## Задание 1

Напишите два скрипта, каждый из которых принимает один параметр и:

- первый - прибавляет к параметру единицу как строку.

  **Например:**

  **./python3 test_1.py 5**

  **51**

```python
import sys

e = str(sys.argv[1]) + '1'
print (e)
```


- второй - прибавляет к параметру единицу как число.

  **Например:**

  **./python3 test_2.py 5**

  **6**

```python
import sys

e = int(sys.argv[1]) + 1
print (e)
```


## Задание 2

Напишите скрипт, который выводит содержимое каталога и подсчитывает в нём количество файлов.

**Например:**

**./test_dir.py**  
**admin_scripts**  
**...**  
**Videos**  
**Total: 22**  
```python
import os
import sys

directory = sys.argv[1] if len(sys.argv) > 1 else '.'

if os.path.exists(directory) and os.path.isdir(directory):
    items = os.listdir(directory)
    file_count = 0
    
    for item in items:
        item_path = os.path.join(directory, item)
        if os.path.isfile(item_path):
            print(item)
            file_count += 1
         
    print(f"Total: {file_count}")
else:
    print(f"{directory} - not exist or not a directory")

```


## Задание 3

Напишите скрипт, который принимает один параметр и определяет, какой объект передан этим параметром (файл, каталог или не существующий). 

**Например:**

**./test.py \windows**  
**c:\windows - dir**  
**./test.py c:\pagefile.sys**  
**c:\pagefile.sys - file**  
**user@user:~$ c:\windows1**  
**c:\windows1 - not exist**  

```python
import sys
import os

path = sys.argv[1]
if os.path.exists(path):
    if os.path.isdir(path):
        print(f"{path} - Directory")
    elif os.path.isfile(path):
        print(f"{path} - file")
else:
    print(f"{path} - not exist")
```


## Задание 4* (необязательное)


### Легенда

Пользователи в нашей компании начали пересылать друг другу некие "секретные" сообщения. Т.к. доступа к средствам криптографии у них нет, для "шифрования" они используют преобразование строк в формат [Base64](https://ru.wikipedia.org/wiki/Base64).

### Задача

Написать скрипт, который:

1. принимает на входе два аргумента. Первый - режим преобразования, второй - строка;
2. если первый параметр равен `crypt` - преобразует второй параметр в строку Base64;
3. если первый параметр равен `decrypt` - преобразует второй параметр в текст;
4. если первый параметр равен любой другой строке - выйти из скрипта с ненулевым кодом возврата и сообщить об этом пользователю;
5. если количество параметров скрипта не равно двум - выйти из скрипта с ненулевым кодом возврата выдать сообщение пользователю и завершить работу.

Пример работы:

```
$ ./script.py crypt test
Encrypting...
dGVzdAo=
$ ./script.py decrypt dGVzdAo=
Decrypting...
test
```

Подсказки
Для работы с base64 в языке Python сначала нужно перевести строку в ASCII:

<pre>text_bytes = text.encode('ascii')</pre>

После работы с base64, нужно выполнить обратное преобразование:
<pre>text_bytes = text.decode('ascii')</pre>

Сама конвертация в/из base64 выполняет функциями:
<pre>base64.b64encode(<строка>) и base64.b64decode(<строка>)</pre>
