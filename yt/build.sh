#!/bin/bash

export PNG_DIR=$PREFIX
export FTYPE_DIR=$PREFIX
export HDF5_DIR=$PREFIX

echo $PYTHON
$PYTHON setup.py install
