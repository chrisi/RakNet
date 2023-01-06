git reset --hard
git pull
mkdir build
cd build
make clean
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build .
make install
