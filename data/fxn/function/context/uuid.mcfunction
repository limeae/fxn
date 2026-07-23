#saves entitys hyphenated hexadecimal uuid to $(namespace).uuid
#with {namespace}

#>namespace:  "storage draft:draft example.data"

#but do not save to a score!

scoreboard players set 16 ftemp 16
#>so much scoreboard maths

#>get the 0th prefix
data modify storage fxn:context uuid.prefix set value 0
#UUID[0] -> score int ftemp
execute store result score int ftemp run data get entity @s UUID[0]
#score decrement ftemp = 7 = storage fxn:context uuid.decrement
execute store result storage fxn:context uuid.decrement int 1 run scoreboard players set decrement ftemp 7
#convert 'int' into hexadecimal digits {prefix BYTE, decrement--} & score int ftemp UUID[0]
function fxn:context/macro/uuid/loop with storage fxn:context uuid
#loops

#get prefix 1
data modify storage fxn:context uuid.prefix set value 1
execute store result score int ftemp run data get entity @s UUID[1]
execute store result storage fxn:context uuid.decrement int 1 run scoreboard players set decrement ftemp 7
function fxn:context/macro/uuid/loop with storage fxn:context uuid
#loops

#get prefix 2
data modify storage fxn:context uuid.prefix set value 2
execute store result score int ftemp run data get entity @s UUID[2]
execute store result storage fxn:context uuid.decrement int 1 run scoreboard players set decrement ftemp 7
function fxn:context/macro/uuid/loop with storage fxn:context uuid
#loops

#get prefix 3
data modify storage fxn:context uuid.prefix set value 3
execute store result score int ftemp run data get entity @s UUID[3]
execute store result storage fxn:context uuid.decrement int 1 run scoreboard players set decrement ftemp 7
function fxn:context/macro/uuid/loop with storage fxn:context uuid
#loops

#concatenate with macro
$data modify storage fxn:context uuid.namespace set value "$(namespace)"
return run function fxn:context/macro/uuid/concatenate with storage fxn:context uuid
