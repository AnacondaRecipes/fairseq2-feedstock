
cd %SRC_DIR%\fairseq2n

cmake ^
    -DTORCH_LIBRARY=%LIBRARY_LIB%\python3.11\site-packages\torch\lib\libtorch.so ^
    -DTORCH_CPU_LIBRARY=%LIBRARY_LIB%\python3.11\site-packages\torch\lib\libtorch_cpu.so ^
    -DTORCH_API_INCLUDE_DIR=%LIBRARY_LIB%\python3.11\site-packages\torch\include\torch\csrc\api\include ^
    -DTORCH_INCLUDE_DIR=%LIBRARY_LIB%\python3.11\site-packages\torch\include ^
    -DC10_LIBRARY=%LIBRARY_LIB%\python3.11\site-packages\torch\lib\libc10.so ^
    -GNinja -B build
cmake --build build

cd %SRC_DIR%\fairseq2n\python
%PYTHON% -m pip install . -v --no-deps --no-build-isolation

@REM cd %SRC_DIR%
@REM %PYTHON% -m pip install . -v --no-deps --no-build-isolation
