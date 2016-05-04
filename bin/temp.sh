#!/bin/sh

i3_raw(){ echo $(i3-msg -t get_workspaces); }
i3_ws_list(){ echo $(i3_raw | jq '. | length'); }
i3_ws_name(){ echo $(i3_raw | jq -r --arg $1 '$($1)' ".[$1].name"); }

echo $(i3_ws_name 2)
