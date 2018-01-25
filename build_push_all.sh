#!/usr/bin/env bash

cd build_explorer
make build
make push
cd ../build_master/
make build
make push
cd ../build_node/
make build
make push
cd ../build_web_app_nginx/
make build
make push
cd ../build_web_app_php/
make build
make push
echo "Completed!"