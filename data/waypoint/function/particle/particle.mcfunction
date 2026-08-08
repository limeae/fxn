#actually displays the particle to players
#with storage waypoint:$(group) list[$(decrement)] {name, group, x, y, z, dim, color[]}


#
$execute in $(dim) run particle dust{color:$(color),scale:2} $(x) $(y) $(z) 0 0 0 0 0 normal @a[tag=wp.$(group)]
