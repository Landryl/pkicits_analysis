#!/bin/sh

# try to clean some internal functions of proverif
sed -i 's/catch-fail//g' $1
sed -i -E 's/if \(?not-caught-fail\([^\)]*\) then (.*) else fail-any\)?/\1/g' $1

sed -i 's/3-proj-3-tuple/p3proj3tuple/g' $1
sed -i 's/2-proj-3-tuple/p2proj3tuple/g' $1
sed -i 's/1-proj-3-tuple/p1proj3tuple/g' $1

cat lib.pvl $1 > $1.new
