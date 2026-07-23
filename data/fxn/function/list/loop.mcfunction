#runs from command/list, loops
#with {} & storage fxn:list list


#
#is command present check -> return number of successes
execute unless data storage fxn:list list[0] run return run scoreboard players get success ftemp


#get and remove command in list
data modify storage fxn:list command set from storage fxn:list list[0]
data remove storage fxn:list list[0]


#>if command is a context shift, return run command/handle
execute if data storage fxn:list command.command run return run function fxn:command/handle with storage fxn:list command
#
#>otherwise run "command" as a command
#specify if list is created from another list
scoreboard players add in_list ftemp 1
execute unless data storage fxn:list command.command store success score add ftemp run function fxn:command with storage fxn:list
scoreboard players remove in_list ftemp 1

#add to success count
scoreboard players operation success ftemp += add ftemp


#loops
return run function fxn:list/loop
