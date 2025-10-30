#!/bin/sh
protoc -I . -I ../include \
  --go_out=. --go_opt=paths=source_relative \
  --go-string-consts_out=. --go-string-consts_opt=paths=source_relative \
  ./test.proto
