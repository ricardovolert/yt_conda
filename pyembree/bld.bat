set CPATH=%LIBRARY_INC%
set LIBRARY_PATH=%LIBRARY_LIB%
set LIBPATH=%LIBRARY_LIB%
set LIB=%LIBRARY_LIB%

copy %LIBRARY_LIB%\*.dll %LIBRARY_LIB%\..\..\libs\

"%PYTHON%" setup.py build --compiler=mingw32 install
if errorlevel 1 exit 1

:: Add more build steps here, if they are necessary.

:: See
:: http://docs.continuum.io/conda/build.html
:: for a list of environment variables that are set during the build process.
