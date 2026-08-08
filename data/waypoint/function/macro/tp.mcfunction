#tp to a waypoint position
#with storage waypoint:$(group) list[{name:"$(name)"}] {x, y, z, r0, dim}


#
$execute in $(dim) run tp @s $(x) $(y) $(z) $(r0) 0
