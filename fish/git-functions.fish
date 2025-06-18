#!/bin/fish

function gpsup -d "Git push and set upstream"
  git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)
end

function gsmu -d "Update Git submodules"
  git submodule sync --recursive
  git submodule update --init --recursive
  git submodule foreach git reset --hard
  git submodule foreach git clean -xfd
end

function gchpr --argument-names 'PR' --argument-names 'branch' -d "Fetch GitHub PR as new branch"
  if test -n "$PR" && test -n "$branch"
    set escaped_branch_name $(string replace -a ':' '/' $branch)
    echo "Checking out PR#$PR as branch '$escaped_branch_name'"
    git fetch origin pull/$PR/head
    git checkout FETCH_HEAD -b $escaped_branch_name
  else
    echo (set_color red) "PR id and branch name must be provided." (set_color normal)
  end
end
