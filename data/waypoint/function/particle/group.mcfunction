#handle groups for particles
#with storage fxn:matches {value (group)}


#nested fxn:array/cmd
$data modify storage fxn:array cmd.group set value $(value)
$function fxn:array/cmd {namespace:"storage waypoint:$(value) list", command:"function waypoint:particle/entry with storage fxn:array cmd"}
