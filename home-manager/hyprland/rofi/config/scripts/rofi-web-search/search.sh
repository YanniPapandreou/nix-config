#!/usr/bin/env bash

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit; pwd -P )"
ROFI_CMD="rofi -dmenu -i -matching fuzzy"
SHOW_ICONS="-show-icons"

web_search() {
    # apis="google\nwikipedia\nyoutube\nreddit\narchwiki\nflathub"
    apis="google\nwikipedia\nyoutube\nreddit\narchwiki"

    # remember last entry chosen
    local api_row=0
    local api_text

    while api=$(echo -e $apis | $ROFI_CMD -selected-row ${api_row} -format 'i s' -p "Website"); do
        api_row=$(echo "$api" | awk '{print $1;}')
        api_text=$(echo "$api" | cut -d' ' -f2-)

        if [ "$api_text" = "reddit" ]; then
            "$SCRIPT_PATH"/rofi-reddit.sh && exit
        # elif [ "$api_text" = "flathub" ]; then
            # "$SCRIPT_PATH"/rofi-flathub.sh && exit
        else
            "$SCRIPT_PATH"/rofi-web-search.sh "$api_text" && exit
        fi
    done
}

# run
web_search
