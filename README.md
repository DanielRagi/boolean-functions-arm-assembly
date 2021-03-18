# Boolean Functions - ARM Assembly
In this repo you will find various exercises of Boolean functions, coded in ARM Assembly.

## _Conventions_
- A + B : A OR B
- A . B : A AND B
- /A : NOT A

Execute with:
```sh
gcc -o [CompilationName] [Exercise.s]
./[CompilationName]
```
- [CompilationName]: Name that you will give to the compiled file.
- [Exercise.s]: Name of the .s file corresponding to the exercise you will run.

![Run](https://i.imgur.com/e2d8PjK.png)


## _Exercise 1_
Function:
F(A,B,C,D,E) = /A./C + /A./D + D.E + A./E

Function (Maxterms):
F(A,B,C,D,E) = π(17,21,29,25,6,14)


## _Exercise 2_
Function: 
F(A,B,C,D,E) = AD + /AC/E + /BCD + /AB/C + /AB/D + B/CE + BC/E + A/BE

Function (Maxterms):
F(A,B,C,D,E) = π(0,1,3,2,16,20,29,24,5,15)
