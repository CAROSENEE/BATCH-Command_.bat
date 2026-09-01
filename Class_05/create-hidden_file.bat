@echo off

::Normal file create
echo Secret Data > Secret.txt

::Hidden attribute  set
attrib +h secret.txt

::Hidden file dekha
dir /ah
pause