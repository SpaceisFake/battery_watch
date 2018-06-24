#!/bin/bash

LOG=/var/log/battery_log
processes="$(top -b | head -n 12 | tail -n 7 | awk {'printf ("%s\t%s\t%s\t%s\t\n", $1, $9, $10, $12)'})"
battery="$(upower -i $(upower -e | grep -i BAT) | grep -E "state|to\ full|percentage" \
                 | cut -d':' -f2 | tail -c 5 )"
timz="$(date +%m/%d-%H:%M)"
headers=$(echo "$processes" | sed -n 2p)

printf "%s\t%s\t%s\n"  "$timz" "$battery" "$headers"
declare -A process
for i in {3..7}
  do
    process[$i]=$(echo "$processes" | sed -n "$i"p)
    printf "\t\t\t%s\n" "${process[$i]}"
    #CPU_total=($CPU_total +  ($echo "${process[$i]}" | awk {'print $9'}))
  done
