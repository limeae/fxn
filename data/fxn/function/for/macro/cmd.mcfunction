#run each int between start and end in the for loop
#with storage fxn:for cmd {i, end, command, path_command}


#
#reference score 'i ftemp' instead of using macros

#>run command
$$(command)

#path to next nest if present
$execute if score in_nest ftemp matches 1.. run function fxn:command {command:"$(path_command)"}

#if i=end, return fail (not successes)
$scoreboard players set i ftemp $(i)
$scoreboard players set end ftemp $(end)
execute if score i ftemp = end ftemp run return fail
#else

#add dif to i
execute if score end ftemp < i ftemp run scoreboard players set dif ftemp -1
execute if score end ftemp >= i ftemp run scoreboard players set dif ftemp 1
execute store result storage fxn:for cmd.i int 1 run scoreboard players operation i ftemp += dif ftemp
#save command, end, and dif in case they were changed (by a nested for loop)
$data modify storage fxn:for cmd.command set value '$(command)'
$execute if score in_nest ftemp matches 1.. run data modify storage fxn:for cmd.path_command set value '$(path_command)'
execute store result storage fxn:for cmd.end int 1 run scoreboard players get end ftemp

#>loop with i++/--
function fxn:for/macro/cmd with storage fxn:for cmd
