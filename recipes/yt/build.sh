#!/bin/bash

echo "$PREFIX" > embree.cfg
$PYTHON setup.py install

cp scripts/* $PREFIX/bin/

sed -n 's/^__version__ = "\(.*\)"$/\1/p' ${SRC_DIR}/yt/__init__.py > __conda_version__.txt
sed -i -e 's/-/_/g' __conda_version__.txt
export HG_LASTTAG_REV=$(hg id -r  'sort(tag(), date) and branch(stable)' -i)
echo $(hg log -r "${HG_LASTTAG_REV}:  and branch(yt)" | grep -c changeset) > __conda_buildnum__.txt
