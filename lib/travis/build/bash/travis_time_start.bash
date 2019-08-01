travis_time_start() {
  local timer_id="$(printf %08x $((RANDOM * RANDOM)))"
  if [[ $# -gt 0 ]]; then
    eval "TRAVIS_TIMER_ID_$1=${timer_id}"
    export TRAVIS_TIMER_ID_$1
  else
    TRAVIS_TIMER_ID="$(printf %08x $((RANDOM * RANDOM)))"
    export TRAVIS_TIMER_ID
  fi
  TRAVIS_TIMER_START_TIME="$(travis_nanoseconds)"
  export TRAVIS_TIMER_START_TIME
  echo -en "travis_time:start:$TRAVIS_TIMER_ID\\r${ANSI_CLEAR}"
}
