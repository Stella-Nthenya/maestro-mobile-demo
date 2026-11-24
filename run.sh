#!/bin/sh
# Usage: ./run.sh <simulator id>. Regression must pass. Guards and known bugs must fail on an assertion.
set -u
DEV="$1"; mkdir -p results
maestro --device "$DEV" test flows --format junit --output results/flows.xml || { echo "REGRESSION FAILED"; exit 1; }
rc=0
for f in guards/*.yaml known-bugs/*.yaml; do
  if out=$(maestro --device "$DEV" test "$f" 2>&1); then echo "UNEXPECTED PASS $f"; rc=1
  elif printf '%s' "$out" | grep -q "Assertion is false"; then echo "failed as expected: $f"
  else echo "BROKEN $f"; printf '%s\n' "$out" | tail -5; rc=1; fi
done
exit $rc
