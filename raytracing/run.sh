set -e

g++ raytracing/main.cpp -o raytracing/output/main -std=c++20 -g -w

export TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
export IMAGE_FILENAME=raytracing/images/$TIMESTAMP.ppm
./raytracing/output/main >$IMAGE_FILENAME
open $IMAGE_FILENAME
