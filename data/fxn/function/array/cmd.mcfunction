#runs 'command' for each entry inside of 'namespace' array
#with {namespace, command}

#>namespace: "storage draft:draft example.array"
#>command must pass parsing to run (write it correctly) | NOTE: macros in command will fail\
    NOTE: use 'with storage fxn:array cmd' {namespace, decrement} to get array entries

#
#save namespace, cmd, cmd, command, break to storage
$data modify storage fxn:array cmd.namespace set value "$(namespace)"
$data modify storage fxn:array cmd.command set value '$(command)'

#get max -> 'score decrement ftemp', 'storage fxn:array cmd.decrement'
$execute store result score decrement ftemp \
store result storage fxn:array cmd.decrement int 1 \
    run function fxn:array/get_max {namespace:"$(namespace)"}
#if empty list, fail
execute if data storage fxn:array {cmd:{decrement:-1}} run return fail

#run the loop {namespace, cmd, command, decrement--}
data modify storage fxn:array cmd.success set value 0
return run function fxn:array/macro/cmd with storage fxn:array cmd
