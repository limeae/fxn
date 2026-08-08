#appends waypoint entry to book in storage
#with storage waypoint:matches merge {page, group, name, color_hex}


#append tp
$data modify storage waypoint:matches pages[$(page)] append value \
    {text:"$(name)",color:"#$(color_hex)",click_event:{action:"run_command",command:"function waypoint:tp {group:$(group), name:\"$(name)\"}"}}
#append "X"
$data modify storage waypoint:matches pages[$(page)] append value \
    {text:" X\n",color:red,click_event:{action:"run_command",command:"function waypoint:remove {group:$(group), name:\"$(name)\"}"}}
