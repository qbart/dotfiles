#!/bin/bash

B=/tmp/discord.json A=~/.config/discord/settings.json && jq '.SKIP_HOST_UPDATE=true' $A > $B && mv $B $A
