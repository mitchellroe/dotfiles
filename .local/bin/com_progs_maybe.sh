#!/bin/bash
#
# com_progs_maybe.sh
#
# Launch communication programs if it's during the work day.

day_of_week=$(date +%u)
if [ "${day_of_week}" -ge 1 ] && [ "${day_of_week}" -le 5 ]; then
  hour=$(date +%H)
  if [ "${hour}" -ge 8 ] && [ "${hour}" -lt 18 ]; then
    flatpak run com.slack.Slack &
    pidgin &
  fi
fi
