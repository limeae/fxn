#set a waypoint position at the current position
#with {group, name, color[]}

#>group: "mypoint"
#>name: "portal"
#>color: [0.1,0.8,0.9]
#results in: 'storage waypoint:mypoint list[{name:"portal", color:[0.1,0.8,0.9], x:6, y:7, z:8, r0:90, r1:0, dim:"minecraft:overworld"}]'

#
#if dimension has no players
execute unless entity @p run return run say no players in dimension!

#if list is empty
$execute unless data storage waypoint:$(group) list[0] run data modify storage waypoint:$(group) list set value []
#>if waypoint 'name' is not in list, prepend
$execute unless data storage waypoint:$(group) list[{name:"$(name)"}] run data modify storage waypoint:$(group) list prepend value {group:$(group),name:"$(name)",color:$(color)}
$execute unless data storage waypoint:$(group) list[{name:"$(name)"}] run function fxn:context/pos_int {namespace:"storage waypoint:$(group) list[0]", include:[all, "!r1"]}
#give new book
$execute unless data storage waypoint:$(group) list[{name:"$(name)"}] run return run function waypoint:book {group:$(group)}
#else

#>if waypoint 'name' is in list, edit
$function fxn:context/pos_int {namespace:"storage waypoint:$(group) list[{name:\\\"$(name)\\\"}]", include:[all, "!r1"]}
$data modify storage waypoint:$(group) list[{name:"$(name)"}].color set value $(color)

#if group not in master list, add to master list
scoreboard players set success ftemp 0
$execute store result score success ftemp run function fxn:array/if_value {namespace:"storage waypoint:master list", value:"$(group)", return:"return 1"}
$execute if score success ftemp matches 0 run data modify storage waypoint:master list append value "$(group)"

#give new book
$function waypoint:book {group:$(group)}
