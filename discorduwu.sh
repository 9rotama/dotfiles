#!/bin/bash

# Discordをyayで更新
echo "Updating Discord with yay..."
yay -Sy discord --noconfirm

# 更新が成功したか確認
if [ $? -eq 0 ]; then
    echo "Discord update completed successfully."
    echo "Starting Discord..."
    discord --no-sandbox
else
    echo "Failed to update Discord. Please check for issues."
    exit 1
fi
