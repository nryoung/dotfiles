#!/usr/bin/env bash
STEAM_LOG="$HOME/.local/share/Steam/logs/content_log.txt"

while true; do
    sudo -u nic pegasus-fe &
    PID=$!
    POS=$(wc -c < "$STEAM_LOG" 2>/dev/null || echo 0)
    RUNNING=false
    
    while kill -0 $PID 2>/dev/null; do
        sleep 2
        NEW=$(tail -c +$((POS + 1)) "$STEAM_LOG" 2>/dev/null | tr -d '\r')
        echo "$NEW" | grep -q "state changed.*App Running" && RUNNING=true
        if [ "$RUNNING" = true ] && echo "$NEW" | grep -qE 'state changed : Fully Installed,$'; then
            kill $PID 2>/dev/null; wait $PID 2>/dev/null; sleep 1; break
        fi
        POS=$(wc -c < "$STEAM_LOG" 2>/dev/null || echo 0)
    done
done
