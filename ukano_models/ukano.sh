cat lib.pvl > tmp.pv
cat $1 >> tmp.pv

../ukano tmp.pv
rm tmp.pv

mv tmp_FOpa.pi ${1%%.*}_FOpa.pv
mv tmp_WAuth.pi ${1%%.*}_WAuth.pv
