travis_time_finish() {
  local result="${?}"
  local travis_timer_end_time
  travis_timer_end_time="$(travis_nanoseconds)"
  local duration
  local timer_id
  if [[ $# -gt 0 ]]; then
    timer_id="TRAVIS_TIMER_ID_$1"
  else
    timer_id=${TRAVIS_TIMER_ID}
  fi
  duration="$((travis_timer_end_time - TRAVIS_TIMER_START_TIME))"
  echo -en "travis_time:end:${timer_id}:start=${TRAVIS_TIMER_START_TIME},finish=${travis_timer_end_time},duration=${duration}\\r${ANSI_CLEAR}"
  return "${result}"
}
