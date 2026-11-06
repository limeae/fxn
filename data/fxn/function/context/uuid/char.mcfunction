#get the current char to uuid.##
#return -
#with {hash}

#hash: 00 | 01 | ... | 07 | ... | 37

#char %= 16
scoreboard players operation char fxn = uuid fxn
scoreboard players operation char fxn %= 16 fxn
scoreboard players operation uuid fxn /= 16 fxn

#char [0, 15] -> [0, f] hexadecimal
execute store result storage fxn:context hex int 1 run scoreboard players get char fxn

#implicit SWITCH [10, 15] -> [a, f]
execute if data storage fxn:context {hex:10} run data modify storage fxn:context hex set value a
execute if data storage fxn:context {hex:11} run data modify storage fxn:context hex set value b
execute if data storage fxn:context {hex:12} run data modify storage fxn:context hex set value c
execute if data storage fxn:context {hex:13} run data modify storage fxn:context hex set value d
execute if data storage fxn:context {hex:14} run data modify storage fxn:context hex set value e
execute if data storage fxn:context {hex:15} run data modify storage fxn:context hex set value f

#send to uuid.hash
$data modify storage fxn:context uuid.$(hash) set from storage fxn:context hex
