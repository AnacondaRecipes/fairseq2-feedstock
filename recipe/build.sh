
cd $SRC_DIR/fairseq2n

extension=""
case $SUBDIR in
  osx-*)
    extension=dylib
    ;;
  *)
    extension=so
    ;;
esac

cmake \
    -DTORCH_LIBRARY=$PREFIX/lib/python${PY_VER}/site-packages/torch/lib/libtorch.${extension} \
    -DTORCH_CPU_LIBRARY=$PREFIX/lib/python${PY_VER}/site-packages/torch/lib/libtorch_cpu.${extension} \
    -DTORCH_API_INCLUDE_DIR=$PREFIX/lib/python${PY_VER}/site-packages/torch/include/torch/csrc/api/include \
    -DTORCH_INCLUDE_DIR=$PREFIX/lib/python${PY_VER}/site-packages/torch/include \
    -DC10_LIBRARY=$PREFIX/lib/python${PY_VER}/site-packages/torch/lib/libc10.${extension} \
    -GNinja -B build
cmake --build build

cd $SRC_DIR/fairseq2n/python
$PYTHON -m pip install . -v --no-deps --no-build-isolation

cd $SRC_DIR
$PYTHON -m pip install . -v --no-deps --no-build-isolation
