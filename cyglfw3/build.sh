#!/bin/bash

CPATH=$PREFIX/include LIBRARY_PATH=$PREFIX/lib ${PYTHON} setup.py install \
	--single-version-externally-managed --record=record.txt || exit 1;
