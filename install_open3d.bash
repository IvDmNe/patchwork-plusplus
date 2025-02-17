set -e

VERSION=0.15.1

[ ! -d Open3D ] && git clone https://github.com/isl-org/Open3D.git -b v$VERSION || echo "Skip pulling repo"

[ ! -d Open3D/build ] && mkdir Open3D/build
cd Open3D/build

cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -Wno-dev \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_PYTHON_MODULE=OFF \
    -DBUILD_ISPC_MODULE=OFF \
    -DBUILD_WEBRTC=OFF


make -j$(nproc)

echo "Applying 'sudo make install'. Enter password"
sudo make install
