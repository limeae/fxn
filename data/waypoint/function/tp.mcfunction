#tp to a waypoint position
#with {group, name}

#>group: "mypoint"
#>name: "portal"
#results in: 'storage waypoint:mypoint list[{name:"portal", x:6, y:7, z:8, r0:90, r1:0, dim:"minecraft:overworld"}]'

#
$function waypoint:macro/tp with storage waypoint:$(group) list[{name:"$(name)"}]
