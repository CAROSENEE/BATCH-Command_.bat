@echo off
(
    echo User: admin
    echo Password: 1234
    echo Date: %date%
    echo Time: %time%
) > config.txt
echo Config file created!
type config.txt
pause