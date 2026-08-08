#remove a waypoint position
#and give the player a new book
#with {group, name}

#>group: "mypoint"
#>name: "portal"
#results in: 'storage waypoint:mypoint list[{name:"portal", x:6, y:7, z:8, r0:90, r1:0, dim:"minecraft:overworld"}]'

#>remove
$data remove storage waypoint:$(group) list[{name:"$(name)"}]
$tellraw @a [{text:"[Waypoint] Group ",color:red}, {text:"$(group)",color:blue,click_event:{action:"run_command",command:"function waypoint:book {group:$(group)}"}}, " updated!"]
#give new book
$function waypoint:book {group:$(group)}
