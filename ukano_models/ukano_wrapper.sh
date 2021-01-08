#!/bin/sh

# ukano must have the equational theory in input file
cat lib.pvl > tmp.pv
cat $1 >> tmp.pv

../ukano tmp.pv
if [ ! $? -eq 0 ]; then
    exit $?
fi
rm tmp.pv

# ukano change types of names, we restore them for
# the eq-thy, the rest should be done by hand

cat lib.pvl > ${1%%.*}_FOpa.pv
cat lib.pvl > ${1%%.*}_WAuth.pv

libsize=$(cat lib.pvl | wc -l)
tail -n +$(($libsize + 4)) tmp_FOpa.pi >> ${1%%.*}_FOpa.pv
tail -n +$(($libsize + 4)) tmp_WAuth.pi >> ${1%%.*}_WAuth.pv

rm tmp_FOpa.pi
rm tmp_WAuth.pi
