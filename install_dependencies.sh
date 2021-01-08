#!/bin/sh

git clone https://github.com/LCBH/UKano.git
cd UKano
git checkout 0c2d8c6
wget https://prosecco.gforge.inria.fr/personal/bblanche/proverif/proverif2.02pl1.tar.gz
tar -xf proverif2.02pl1.tar.gz
make PROVERIF=proverif2.02pl1 all
mv proverif ..
mv ukano ..
