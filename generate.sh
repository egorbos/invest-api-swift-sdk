#!/bin/bash
apiversion=$(<.api-version)
git submodule init
git submodule update
rm -rf Sources/InvestApiSwiftSdk/Contracts
mkdir Sources/InvestApiSwiftSdk/Contracts
cd InvestApi
git checkout $apiversion
protoc $(find src/docs/contracts -iname "*.proto") \
       --proto_path=src/docs/contracts \
       --plugin=../protoc-plugins/protoc-gen-swift \
       --swift_opt=Visibility=Public \
       --swift_out=../Sources/InvestApiSwiftSdk/Contracts \
       --plugin=../protoc-plugins/protoc-gen-grpc-swift \
       --grpc-swift_opt=Visibility=Public,Client=true,Server=false \
       --grpc-swift_out=../Sources/InvestApiSwiftSdk/Contracts
rm -rf ../InvestApi