go build -o libGoInterface.so -buildmode=c-shared cmd/main.go

mkdir -p include

mv libGoInterface.h include/GoInterface.h
# mv libGoInterface.so libGoInterface.so
