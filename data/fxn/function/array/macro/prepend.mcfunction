#appends an array to another array
#with {from NAMESPACE, to NAMESPACE, decrement--}

#>namespace: "storage draft:draft example.array"


#
#if under 0, return size of 'from' bc why not
$scoreboard players set decrement ftemp $(decrement)
$execute if score decrement ftemp matches ..-1 run return run function fxn:array/get_max {namespace:"$(from)"}
#else

#>append from $(decrement)
$data modify $(to) prepend from $(from)[$(decrement)]

#decrement-- -> 'storage fxn:array prepend.decrement'
$scoreboard players set decrement ftemp $(decrement)
execute store result storage fxn:array prepend.decrement int 1 \
    run scoreboard players remove decrement ftemp 1
#loop {from NAMESPACE, to NAMESPACE, decrement--}
return run function fxn:array/macro/prepend with storage fxn:array prepend
