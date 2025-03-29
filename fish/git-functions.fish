#!/bin/fish

function gpsup
  git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)
end

