#loops in a direction with a command
#with {dist, i, cmd}

#>i max iterations


#>run raycast
scoreboard players reset failsafe ftemp
$execute store result score return ftemp run function fxn:utils/raycast {dist:$(dist), i:$(i), cmd:'$(cmd)', return:0}
return run scoreboard players get return ftemp
