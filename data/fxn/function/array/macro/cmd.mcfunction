#runs 'command' with each entry inside of 'namespace' array
#runs from array/cmd
#with {namespace, command, decrement--}

#>namespace: "storage draft:draft example.array"
#>command must pass parsing to run (write it correctly)


#
#if -1, return number of successes
$scoreboard players set decrement ftemp $(decrement)
execute if score decrement ftemp matches ..-1 run return run scoreboard players get cmdsuccess ftemp
#else

#get some data (for if statement enjoyers)
$data modify storage fxn:matches value set from $(namespace)[$(decrement)]
#add more here

#>run command | NOTE: use 'function draft:draft with storage fxn:array cmd' {namespace, decrement} to get array entries
$execute store result score add ftemp run $(command)
scoreboard players operation cmdsuccess ftemp += add ftemp
#and add to success ^^^

#decrement-- -> 'storage fxn:array cmd.decrement'
$scoreboard players set decrement ftemp $(decrement)
execute store result storage fxn:array cmd.decrement int 1 \
    run scoreboard players remove decrement ftemp 1
#loop {namespace, cmd, command, break, decrement--}
return run function fxn:array/macro/cmd with storage fxn:array cmd
