.PHONY: clean create-proto compile-proto run

clean:
	rm -rf ./output/*
	rm -rf ./bin/*

build:
	mkdir -p ./bin/
	go build -o ./bin/ocsf-schema

compile-proto:
	mkdir -p ./output/java
	mkdir -p ./output/golang
	find ./output/proto -type f -name "*.proto" | xargs protoc --proto_path=./output/proto --java_out=./output/java --go_opt=paths=source_relative --go_out=./output/golang

test-run:
	./bin/ocsf-schema generate proto file_activity security_finding

run: clean build test-run