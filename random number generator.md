# Date: 22 Nov 2019

Here is an exmplae for random naumber generator

* case: randdom number between two digitis.  
* example: a four digits random number between 1000 to 9999

## The funciton is the following

*selection = RANDOM % (upper - lower + 1) + lower*

dif = 9999 - 1000 = 8999 +1 = 9000

```
for 1 in {1..100}; do echo $(($(($RANDOM % 9000)) + 1000)); done
```
