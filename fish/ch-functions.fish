#!/bin/fish

set CH_EXTRA_ARGS 
switch (uname)
case Darwin
  set CH_CC_COMPILER -DCMAKE_C_COMPILER=/opt/homebrew/opt/llvm/bin/clang-19
  set CH_CXX_COMPILER -DCMAKE_CXX_COMPILER=/opt/homebrew/opt/llvm/bin/clang++-19
case Linux
  set CH_CC_COMPILER -DCMAKE_C_COMPILER=/usr/lib/ccache/clang-19
  set CH_CXX_COMPILER -DCMAKE_CXX_COMPILER=/usr/lib/ccache/clang++-19
end

function ncores
  if command -q nproc
    echo (nproc --all)
  else if command -q sysctl
    echo (sysctl -n hw.ncpu)
  else
    echo (grep -c '^processor' /proc/cpuinfo 2>/dev/null || echo 16)
  end
end

set CH_REPO_PATH ~/git/ClickHouse

set CH_COMMON_ARGS -DENABLE_BUILD_PATH_MAPPING=0 -DENABLE_TESTS=0 -DENABLE_THINLTO=0 -DPARALLEL_COMPILE_JOBS=(ncores) -DPARALLEL_LINK_JOBS=(ncores)

set CH_SLIM_ARGS -DENABLE_LIBRARIES=0 -DENABLE_LIBURING=0
set CH_FAT_ARGS -DENABLE_LIBRARIES=1

set CH_DEBUG_ARGS -DCMAKE_BUILD_TYPE=Debug -DDEBUG_O_LEVEL=0
set CH_RELEASE_ARGS -DCMAKE_BUILD_TYPE=RelWithDebInfo

function src -d "Go to main repo of ClickHouse"
  cd $CH_REPO_PATH
end

function cdPrv --argument-names 'path' -d "Change context to the private repo"
  if test -n "$path"
    set CH_REPO_PATH $path
    src
  else
    echo (set_color red) "Private repo path must be provided." (set_color normal)
  end
end

function debugPath
  echo $CH_REPO_PATH/build/Debug | string trim
end

function releasePath
  echo $CH_REPO_PATH/build/Release | string trim
end

function maked -d "Make ClickHouse (slim) in debug mode"
  mkdir -p (debugPath)
  pushd $CH_REPO_PATH
  cmake $CH_CC_COMPILER $CH_CXX_COMPILER $CH_COMMON_ARGS $CH_SLIM_ARGS $CH_DEBUG_ARGS $CH_EXTRA_ARGS -S . -B (debugPath)
  popd
end

function maker -d "Make ClickHouse (slim) in release mode"
  mkdir -p (releasePath)
  pushd $CH_REPO_PATH
  cmake $CH_CC_COMPILER $CH_CXX_COMPILER $CH_COMMON_ARGS $CH_SLIM_ARGS $CH_RELEASE_ARGS $CH_EXTRA_ARGS -S . -B (releasePath)
  popd
end

function makedf -d "Make ClickHouse (fat) in debug mode"
  mkdir -p (debugPath)
  pushd $CH_REPO_PATH
  cmake $CH_CC_COMPILER $CH_CXX_COMPILER $CH_COMMON_ARGS $CH_FAT_ARGS $CH_DEBUG_ARGS $CH_EXTRA_ARGS -S . -B (debugPath)
  popd
end

function makerf -d "Make ClickHouse (fat) in release mode"
  mkdir -p (releasePath)
  pushd $CH_REPO_PATH
  cmake $CH_CC_COMPILER $CH_CXX_COMPILER $CH_COMMON_ARGS $CH_FAT_ARGS $CH_RELEASE_ARGS $CH_EXTRA_ARGS -S . -B (releasePath)
  popd
end

function cpl -d "Compile ClickHouse in debug mode"
  mkdir -p (debugPath)
  pushd (debugPath)
  cmake --build . --parallel --
  popd
end

function cplr -d "Compile ClickHouse in release mode"
  mkdir -p (releasePath)
  pushd (releasePath)
  cmake --build . --parallel --
  popd
end

function runs -d "Start ClickHouse server in debug mode"
  pushd $CH_REPO_PATH
  eval (debugPath)/programs/clickhouse-server
  popd
end

function runrs -d "Start ClickHouse server in release mode"
  pushd $CH_REPO_PATH
  eval (releasePath)/programs/clickhouse-server
  popd
end

function runc -d "Start ClickHouse client in debug mode"
  pushd $CH_REPO_PATH
  eval (debugPath)/programs/clickhouse-client
  popd
end

function runrc -d "Start ClickHouse client in release mode"
  pushd $CH_REPO_PATH
  eval (releasePath)/programs/clickhouse-client
  popd
end

function testd --argument-names 'name' --argument-names 'runs' -d "Invoke C++ unit test (debug) with the given name"
  if test -n "$name" 
    pushd $CH_REPO_PATH
    if test -n "$runs" 
      PATH=(debugPath)/programs:$PATH ./tests/clickhouse-test --test-runs $runs $name
    else
      PATH=(debugPath)/programs:$PATH ./tests/clickhouse-test $name
    end
    popd
  else 
    echo (set_color red) "Error: unit test name must be provided." (set_color normal)
  end
end

function testr --argument-names 'name' -d "Invoke C++ unit test (release) with the given name"
  if test -n "$name" 
    pushd $CH_REPO_PATH
    PATH=(releasePath)/programs:$PATH ./tests/clickhouse-test $name
    popd
  else 
    echo (set_color red) "Error: unit test name must be provided." (set_color normal)
  end
end

function makecihappy --argument-names 'commit' -d "Make CI happy by marking tests green."
  if test -n "$commit"
    echo "Marking tests green in commit '$commit'"

    gh api repos/ClickHouse/ClickHouse/statuses/"$commit" -X POST -F state=success -F description="Manually set" -F context="Mergeable Check"
    gh api repos/ClickHouse/ClickHouse/statuses/"$commit" -X POST -F state=success -F description="Manually set" -F context="CH Inc sync"
  else
    echo (set_color red) "Commit SHA must be provided." (set_color normal)
  end
end

function xs -d "Compile and run ClickHouse server in debug mode"
  cpl
  runs
end

function xrs -d "Compile and run ClickHouse server in release ode"
  cplr
  runrs
end

alias chs=runs
alias chc=runc
