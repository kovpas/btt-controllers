#!/bin/bash

#####
# DESCRIPTION: Updates the appearance of the input source icon by reading
# the contents of the service-owned status file.
#
# USAGE: ./volume-controller
#     <sys_root>
#         Path to the BetterTouchTool system service and caches folder.
#####


##### @interface #####
# Coordinate to get the data from
coordinate=${1:-'52.368,4.903'}

# Optionally set the `BTT_SYS_ROOT` environment variable to the internal system
# folder used by services to save and share state. Defaults to `~/.btt`
sys_root_arg=${2:-${BTT_USR_ROOT}}
btt_sys_root=${sys_root_arg:-~/.bettertouchtool/presets}


##### @implementation #####
buienalarm_directory="${btt_sys_root}/buienalarm"
buienalarm_filepath="${buienalarm_directory}/buienalarm"
base64icon="$($buienalarm_filepath --coordinate=${coordinate})"
echo "{\"text\":\"icon\", \"icon_data\": \"${base64icon}\"}"