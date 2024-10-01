
cd $SRC_DIR/fairseq2n

cmake \
    -DTORCH_LIBRARY=$PREFIX/lib/python3.11/site-packages/torch/lib/libtorch.so \
    -DTORCH_CPU_LIBRARY=$PREFIX/lib/python3.11/site-packages/torch/lib/libtorch_cpu.so \
    -DTORCH_API_INCLUDE_DIR=$PREFIX/lib/python3.11/site-packages/torch/include/torch/csrc/api/include \
    -DTORCH_INCLUDE_DIR=$PREFIX/lib/python3.11/site-packages/torch/include \
    -DC10_LIBRARY=$PREFIX/lib/python3.11/site-packages/torch/lib/libc10.so \
    -GNinja -B build
cmake --build build

cd $SRC_DIR/fairseq2n/python
$PYTHON -m pip install . -v --no-deps --no-build-isolation

# cd $SRC_DIR
# $PYTHON -m pip install . -v --no-deps --no-build-isolation
