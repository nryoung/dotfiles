#!/usr/bin/env bash
STEAM_LOG="$HOME/.local/share/Steam/logs/content_log.txt"

# Ensure only one instance
exec 200>/tmp/pegasus-wrapper.lock
flock -n 200 || exit 1

# Start Steam minimized if not already running (as user nic with proper env)
if ! pgrep -f 'ubuntu12_32/steam' > /dev/null; then
    sudo -E -u nic XDG_RUNTIME_DIR=/run/user/1000 steam -silent &
    sleep 3
fi

while true; do
    sudo -E -u nic XDG_RUNTIME_DIR=/run/user/1000 pegasus-fe
    # Pegasus exited (user quit or launched a game)
    # Wait for any running Steam game to finish before restarting
    while pgrep -f 'steam.*AppId' > /dev/null 2>&1; do
        sleep 5
    done
    sleep 1
done
