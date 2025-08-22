#!/bin/sh

ELFF=$1

echo "_-=-__-=-__-=-__-=-__-=-__-=-__-=-__-=-__"
echo

arm-none-eabi-size -Ax ${ELFF} | awk '{
    size=strtonum($2);
    addr=strtonum($3);
    if (addr>=0x20000000 && addr<0x20040000) ram += size;
    if (addr>=0x10000000 && addr<0x20000000) rom += size;
}
END {
    print "Flash: " rom " bytes,  RAM: " ram " bytes"
}'

echo
# echo "_-=-__-=-__-=-__-=-__-=-__-=-__-=-__-=-__"


