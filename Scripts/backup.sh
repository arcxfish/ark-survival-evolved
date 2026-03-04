#!/bin/bash

SOURCE_DIR="/home/me/server-ark/resource/ShooterGame/Saved/SavedArks"
DEST_BASE="/home/me/hdd/SavedArks"
MAX_BACKUPS=1000

mkdir -p "$DEST_BASE"

LAST_NUM=$(ls "$DEST_BASE" | grep -oP 'SavedArks-\K[0-9]+' | sort -n | tail -1)
if [ -z "$LAST_NUM" ]; then
    NEXT_NUM=1
else
    NEXT_NUM=$((LAST_NUM + 1))
fi

TIMESTAMP=$(date +%Y%m%d-%H%M%S)
NEW_DIR="$DEST_BASE/SavedArks-$NEXT_NUM-$TIMESTAMP"

mkdir -p "$NEW_DIR"
cp -r "$SOURCE_DIR"/* "$NEW_DIR/"

echo "Backup created: $NEW_DIR"

cd "$DEST_BASE" || exit
CURRENT_COUNT=$(ls -d SavedArks-* 2>/dev/null | wc -l)

if [ "$CURRENT_COUNT" -gt "$MAX_BACKUPS" ]; then
    REMOVE_COUNT=$((CURRENT_COUNT - MAX_BACKUPS))
    ls -dt SavedArks-* | tail -n "$REMOVE_COUNT" | xargs -d '\n' rm -rf
    echo "Removed $REMOVE_COUNT old backup(s)."
fi