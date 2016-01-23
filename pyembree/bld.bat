set INCLUDE=%LIBRARY_INC%
set LIBPATH=%LIBRARY_LIB%
set LIB=%LIBRARY_LIB%

"%PYTHON%" setup.py build --compiler=mingw32 install
if errorlevel 1 exit 1

:: Add more build steps here, if they are necessary.

:: See
:: http://docs.continuum.io/conda/build.html
:: for a list of environment variables that are set during the build process.
