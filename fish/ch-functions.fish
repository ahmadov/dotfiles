#!/bin/fish

set CH_REPO_PATH ~/git/ClickHouse
set CH_DEBUG_PATH $CH_REPO_PATH/build/Debug
set CH_RELEASE_PATH $CH_REPO_PATH/build/Release


set CH_COMMON "-DENABLE_BUILD_PATH_MAPPING=0 -DENABLE_TESTS=0"

set CH_SLIM_ARGS "-DENABLE_LIBRARIES=0 -DENABLE_LIBURING=0"
set CH_FAT_ARGS "-DENABLE_LIBRARIES=1"

set CH_DEBUG_ARGS "-DCMAKE_BUILD_TYPE=Debug -DDEBUG_O_LEVEL=0"
set CH_RELEASE_ARGS "-DCMAKE_BUILD_TYPE=RelWithDebInfo"

function src -d "Go to main repo of ClickHouse"
  cd $CH_REPO_PATH
end

function maked -d "Make ClickHouse (slim) in debug mode"
  mkdir -p $CH_DEBUG_PATH
  pushd $CH_REPO_PATH
  fish -c "cmake $CH_SLIM_ARGS $CH_DEBUG_ARGS $CH_COMMON -S . -B $CH_DEBUG_PATH"
  popd
end

function maker -d "Make ClickHouse (slim) in release mode"
  mkdir -p $CH_RELEASE_PATH
  pushd $CH_REPO_PATH
  fish -c "cmake $CH_SLIM_ARGS $CH_RELEASE_ARGS $CH_COMMON -S . -B $CH_RELEASE_PATH"
  popd
end

function makedf -d "Make ClickHouse (fat) in debug mode"
  mkdir -p $CH_DEBUG_PATH
  pushd $CH_REPO_PATH
  fish -c "cmake $CH_FAT_ARGS $CH_DEBUG_ARGS $CH_COMMON -S . -B $CH_DEBUG_PATH"
  popd
end

function makerf -d "Make ClickHouse (fat) in release mode"
  mkdir -p $CH_RELEASE_PATH
  pushd $CH_REPO_PATH
  fish -c "cmake $CH_FAT_ARGS $CH_RELEASE_ARGS $CH_COMMON -S . -B $CH_RELEASE_PATH"
  popd
end

function cpld -d "Compile ClickHouse in debug mode"
  mkdir -p $CH_DEBUG_PATH
  pushd $CH_DEBUG_PATH
  ninja clickhouse-server clickhouse-client
  popd
end

function cplr -d "Compile ClickHouse in release mode"
  mkdir -p $CH_RELEASE_PATH
  pushd $CH_RELEASE_PATH
  ninja clickhouse-server clickhouse-client
  popd
end

function runds -d "Start ClickHouse server in debug mode"
  cpld
  pushd $CH_REPO_PATH
  $CH_DEBUG_PATH/programs/clickhouse-server
  popd
end

function runrs -d "Start ClickHouse server in release mode"
  cplr
  pushd $CH_REPO_PATH
  $CH_RELEASE_PATH/programs/clickhouse-server
  popd
end

function rundc -d "Start ClickHouse client in debug mode"
  cpld
  pushd $CH_REPO_PATH
  $CH_DEBUG_PATH/programs/clickhouse-client
  popd
end

function runrc -d "Start ClickHouse client in release mode"
  cplr
  pushd $CH_REPO_PATH
  $CH_RELEASE_PATH/programs/clickhouse-client
  popd
end

function testd --argument-names 'name' -d "Invoke C++ unit test (debug) with the given name"
  if test -n "$name" 
    pushd $CH_REPO_PATH
    PATH=$CH_DEBUG_PATH/programs:$PATH ./tests/clickhouse-test $argv[1]
    popd
  else 
    echo (set_color red) "Error: unit test name must be provided." (set_color normal)
  end
end

function testr --argument-names 'name' -d "Invoke C++ unit test (release) with the given name"
  if test -n "$name" 
    pushd $CH_REPO_PATH
    PATH=$CH_RELEASE_PATH/programs:$PATH ./tests/clickhouse-test $argv[1]
    popd
  else 
    echo (set_color red) "Error: unit test name must be provided." (set_color normal)
  end
end
