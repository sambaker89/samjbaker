# Date: 21 Nov 2019

In each of the Linux of ditro, it contains a default dictonary in the following locaiton
  /usr/shar/dict
the word list is collected in the file, one word per line.

In the file "words", it collectes about 102,305 individual American English words.

This note describe how to select randomly a single words from this word list.

```
#! /usr/bin/env python

import random
data=open("/usr/share/dict/words").read().split()
print random.sample(data,1)[0]
```

This snip of python codes will randomly select a single word from the list.  Each word
has the same chance been select (simple, equal distro).  In fact, it is all possible that 
a words may be selected more than once.

## If you like to select a 10 words list:

```
for i in {0..9}; do ./select_word.py; done
```

If you increase the set to more than 10, like {0..99} you will see repeat selection.

## You can also use the linx shuf command

```
shuf -n10 /usr/share/dict/words
```

* this will yields 10 random select words from the dictonary list


[here is a link for more methods](https://www.unix.com/shell-programming-and-scripting/111753-random-word-flat-text-file.html)
