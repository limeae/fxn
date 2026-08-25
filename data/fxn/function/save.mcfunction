#save data to the save list
#>return the array key value
#with {save}

#save does not handle strings, please use structs{with internal string values}
#>array key value maps to: 'storage fxn:save list[$(key)]'

#save
$data modify storage fxn:save list append value $(save)
return run scoreboard players add save.list ftemp 1
