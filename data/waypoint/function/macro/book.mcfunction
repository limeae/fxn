#gets waypoint entry data to storage for macro/book_merge
#with storage fxn:array cmd {group, decrement}


#save waypoint data to matches
$data modify storage waypoint:matches merge set from storage waypoint:$(group) list[$(decrement)]
#save group to matches
$data modify storage waypoint:matches merge.group set value $(group)

#get highest numbered page
execute store result storage waypoint:matches merge.page int 1 run function fxn:array/get_max {namespace:"storage waypoint:matches pages"}
#if current page is full, append new page
execute store result score page ftemp run function waypoint:macro/book_page with storage waypoint:matches merge
execute if score page ftemp matches 24.. run data modify storage waypoint:matches pages append value []
#get new highest numbered page
execute store result storage waypoint:matches merge.page int 1 run function fxn:array/get_max {namespace:"storage waypoint:matches pages"}

#convert color array to color_hex
function waypoint:macro/color_hex

#>merge
function waypoint:macro/book_merge with storage waypoint:matches merge
