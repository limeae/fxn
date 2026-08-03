#appends and runs a list of functions with the current context
#with {list:['command', 'command',...]}

#>example:
#>function fxn:list {list: ['say 1', 'say 2', 'function fxn:list {list: ["say 3", "say 4"]}']}

#note: running a list within a list, with another command after the nested list, is really memory intensive
#ex: function fxn:list {list: ['say me1', 'function fxn:list {list:["execute as @n[type=cow] run say cow"]}', 'say me1']}
#however, running a nested list with no command after is fine!
#ex: function fxn:list {list: ['say me1', 'function fxn:list {list:["execute as @n[type=cow] run say cow"]}']}

#
#if something is already in list, preserve context at the current point
#preserve the current context
execute if data storage fxn:list list[0] run data modify storage fxn:list context.tags set value ["context"]
execute if data storage fxn:list list[0] run data modify storage fxn:list context.command set value "function fxn:list/loop"
execute if data storage fxn:list list[0] run function fxn:context/pos {namespace:"storage fxn:list context", include:[all]}
execute if data storage fxn:list list[0] run data remove storage fxn:list context.uuid
execute if data storage fxn:list list[0] run function fxn:context/uuid {namespace:"storage fxn:list context"}
#prepend preserver
execute if data storage fxn:list list[0] run data modify storage fxn:list list prepend from storage fxn:list context

#save list to storage
#>PREPEND!!
$data modify storage fxn:list temp_list set value $(list)
function fxn:array/prepend {from:"storage fxn:list temp_list", to:"storage fxn:list list"}

#
execute unless score in_list ftemp matches 1.. run scoreboard players set success ftemp 0
function fxn:list/loop
#loops
