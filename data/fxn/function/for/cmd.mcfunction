#its a for loop
#with {start, end:{fixed | delta}, command}

#>examples:
#function fxn:for/cmd {start:16, end:{fixed:21}, command:"say I can't reference macros in here :("}
#function fxn:for/cmd {start:16, end:{delta:5}, command:"say I can't reference macros in here :("}
#function fxn:for/cmd {start:16, end:21 (default to fixed), command:"say I can't reference macros in here :("}

#>includes both the start and end value
#start:5, end:5 will run at 5

#reference score 'start ftemp' in your command instead of using macros

#save command
$data modify storage fxn:for cmd.command set value '$(command)'

#clamp to ints
#start -> i
$data modify storage fxn:for temp set value $(start)
execute store result score i ftemp run data get storage fxn:for temp
#end (default to fixed)
$data modify storage fxn:for temp set value $(end)
execute store result score end ftemp run data get storage fxn:for temp
#end.fixed
$data modify storage fxn:for temp set value $(end)
execute if data storage fxn:for temp.fixed store result score end ftemp run data get storage fxn:for temp.fixed
#end.delta (convert to fixed)
$data modify storage fxn:for temp set value $(end)
execute if data storage fxn:for temp.delta store result score end ftemp run data get storage fxn:for temp.delta
execute if data storage fxn:for temp.delta run scoreboard players operation end ftemp += i ftemp

#save i and end to storage
execute store result storage fxn:for cmd.i int 1 run scoreboard players get i ftemp
execute store result storage fxn:for cmd.end int 1 run scoreboard players get end ftemp
#positive or negative difference
execute if score end ftemp < i ftemp run scoreboard players set dif ftemp -1
execute if score end ftemp >= i ftemp run scoreboard players set dif ftemp 1
execute store result storage fxn:for cmd.dif int 1 run scoreboard players get dif ftemp

#reset successes
data modify storage fxn:for cmd.success set value 0

#>run loop
return run function fxn:for/macro/cmd with storage fxn:for cmd
