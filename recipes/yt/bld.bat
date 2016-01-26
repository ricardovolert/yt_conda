:: %set CPATH="%LIBRARY_INC%";"%CPATH%"
:: set LIBRARY_PATH="%LIBRARY_LIB%";"%LIBRARY_PATH%"
:: LIBPATH="%LIBRARY_LIB%";"%LIBPATH%"
:: LIB="%LIBRARY_LIB%";"%LIB%"

copy "%LIBRARY_LIB%"\*.dll "%LIBRARY_LIB%"\..\..\libs\

set EMBREE_DIR="%LIBRARY_PREFIX%"

awk -F "\"" "/__version__/ {print gensub(\"-\", \"_\", 1, $2)>__conda_version__.txt }" yt\__init__.py

hg id -r "sort(tag(), date) and branch(stable)" -i > step1
awk -v dq="\"" "{print \"hg log -r \" dq $0 \": and branch(yt)\"dq > step2.bat }" step1
call "step2.bat" > step3
awk "/changeset:/ {count++} END {print count}" step3 > __conda_buildnum__.txt 

"%PYTHON%" setup.py install
if errorlevel 1 exit 1

:: Add more build steps here, if they are necessary.

:: See
:: http://docs.continuum.io/conda/build.html
:: for a list of environment variables that are set during the build process.
