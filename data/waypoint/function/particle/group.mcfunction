#handle groups for particles
#with storage fxn:matches {value (group)}


#nested fxn:array/cmd
$data modify storage fxn:array group set value $(value)
$function fxn:array {path:'storage waypoint:$(value) list', cmd:'function waypoint:particle/particle with storage fxn:array value', i:0}
