#give the waypoint book with all waypoints inside
#with {group}

say book
#clear book
$clear @s written_book[custom_data={group:$(group)}]

#uses fxn:array/cmd
data modify storage waypoint:matches pages set value [[]]
#title (group)
data modify storage waypoint:matches pages[0] append value ""
$data modify storage waypoint:matches pages[0] append value {text:"       $(group)\n",color:gray,bold:true}
#add particle toggle
$data modify storage waypoint:matches pages[0] append value \
    {text:" - particles\n\n",color:light_purple,click_event:{action:"run_command",command:"function waypoint:particle {group:$(group)}"}}
$data modify storage fxn:array group set value $(group)
$function fxn:array {path:'storage waypoint:$(group) list', cmd:'function waypoint:macro/book with storage fxn:array', i:0}

#summon item
$summon item ~ ~ ~ {Tags:["waypoint_book"],PickupDelay:0,Item:{id:"written_book",components:{\
    "minecraft:custom_data":{group:$(group)}, "minecraft:written_book_content":{title:"$(group)",author:"waypoint"}}}}

#add storage to item
execute as @n[type=item,tag=waypoint_book] run data modify entity @s Item.components."minecraft:written_book_content".pages set from storage waypoint:matches pages
