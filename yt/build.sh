#!/bin/bash

echo "$PREFIX" > embree.cfg
$PYTHON setup.py install

cp scripts/* $PREFIX/bin/

sed -n 's/^__version__ = "\(.*\)"$/\1/p' ${SRC_DIR}/yt/__init__.py > __conda_version__.txt
sed -i -e 's/-/_/g' __conda_version__.txt
(
cat <<'EOF'
import sys
import os
sys.path.insert(0, os.path.join(os.getcwd(), "scripts"))
from pr_backport import *

repo_path = "."
last_major_release = get_first_commit_after_last_major_release(repo_path)
last_dev = get_branch_tip(repo_path, "yt", "experimental")
last_stable = get_branch_tip(repo_path, "stable")
lineage = get_lineage_between_release_and_tip(repo_path, last_major_release, last_dev)
with open("__conda_buildnum__.txt", "w") as fp:
    fp.write("%i" % len(lineage))
EOF
) > gen_buildnum.py
$PYTHON gen_buildnum.py
