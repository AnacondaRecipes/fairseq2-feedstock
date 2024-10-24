
cd %SRC_DIR%\fairseq2n

cmake ^
    -DTORCH_LIBRARY=%LIBRARY_LIB%\python%PY_VER%\site-packages\torch\lib\libtorch.dll ^
    -DTORCH_CPU_LIBRARY=%LIBRARY_LIB%\python%PY_VER%\site-packages\torch\lib\libtorch_cpu.dll ^
    -DTORCH_API_INCLUDE_DIR=%LIBRARY_LIB%\python%PY_VER%\site-packages\torch\include\torch\csrc\api\include ^
    -DTORCH_INCLUDE_DIR=%LIBRARY_LIB%\python%PY_VER%\site-packages\torch\include ^
    -DC10_LIBRARY=%LIBRARY_LIB%\python%PY_VER%\site-packages\torch\lib\libc10.dll ^
    %CMAKE_ARGS% -GNinja -B build
cmake --build build

cd %SRC_DIR%\fairseq2n\python
%PYTHON% -m pip install . -v --no-deps --no-build-isolation

cd %SRC_DIR%
%PYTHON% -m pip install . -v --no-deps --no-build-isolation
