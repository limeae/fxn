#runs 'command' with each entry inside of 'namespace' array
#runs from array/cmd
#with {namespace, command, decrement--, success}

#>namespace: "storage draft:draft example.array"
#>command must pass parsing to run (write it correctly)


#
#if -1, return number of successes
$scoreboard players set decrement ftemp $(decrement)
$execute if score decrement ftemp matches ..-1 run return $(success)
#else

#get some data (for if statement enjoyers)
$data modify storage fxn:matches value set from $(namespace)[$(decrement)]
#add more here

#>run command | NOTE: use 'function draft:draft with storage fxn:array cmd' {namespace, decrement} to get array entries
$scoreboard players set cmdsuccess ftemp $(success)
scoreboard players set add ftemp 0
$execute store result score add ftemp run $(command)
execute store result storage fxn:array cmd.success int 1 run scoreboard players operation cmdsuccess ftemp += add ftemp
#and add to success ^^^

#decrement-- -> 'storage fxn:array cmd.decrement'
$scoreboard players set decrement ftemp $(decrement)
$data modify storage fxn:array cmd.namespace set value "$(namespace)"
$data modify storage fxn:array cmd.command set value '$(command)'
execute store result storage fxn:array cmd.decrement int 1 \
    run scoreboard players remove decrement ftemp 1
#loop {namespace, cmd, command, break, decrement--}
return run function fxn:array/macro/cmd with storage fxn:array cmd
