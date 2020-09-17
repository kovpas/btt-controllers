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
# Optionally set the `BTT_SYS_ROOT` environment variable to the internal system
# folder used by services to save and share state. Defaults to `~/.btt`
sys_root_arg=${1:-${BTT_USR_ROOT}}
btt_sys_root=${sys_root_arg:-~/.bettertouchtool/presets}


##### @implementation #####
locale_icon_base64_directory="${btt_sys_root}/locale"
locale_icon_base64_filepath="${locale_icon_base64_directory}/localebase64icon"
base64icon="$($locale_icon_base64_filepath)"
echo "{\"text\":\" \",\"icon_data\":\"${base64icon}\"}"