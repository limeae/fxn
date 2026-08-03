#run each int between start and end in the for loop
#with storage fxn:for cmd {i, end, dif, command, success}


#
#reference score 'i ftemp' instead of using macros

#>run command
scoreboard players set add ftemp 0
$execute store result score add ftemp run $(command)
$scoreboard players set success ftemp $(success)
execute store result storage fxn:for cmd.success int 1 run scoreboard players operation success ftemp += add ftemp
#and add to success ^^^

#if i=end, return successes
$scoreboard players set i ftemp $(i)
$scoreboard players set end ftemp $(end)
execute if score i ftemp = end ftemp run return run scoreboard players get success ftemp
#else

#add dif to i
$scoreboard players set dif ftemp $(dif)
execute store result storage fxn:for cmd.i int 1 \
    run scoreboard players operation i ftemp += dif ftemp
#save command and end in case they were changed (by a nested for loop)
$data modify storage fxn:for cmd.command set value '$(command)'
execute store result storage fxn:for cmd.end int 1 run scoreboard players get end ftemp

#>loop with i++/--
return run function fxn:for/macro/cmd with storage fxn:for cmd
