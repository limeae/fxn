#runs a function in schedule when gametime matches
#with {index}


#get [].loops
$execute store result score loops ftemp run data get storage fxn:schedule list[$(index)].loops
$execute if score loops ftemp matches 1.. store result storage fxn:schedule list[$(index)].loops int 1 run scoreboard players remove loops ftemp 1

#timedelta to gametime
$execute unless score loops ftemp matches 0 store result score scheduletime ftemp run data get storage fxn:schedule list[$(index)].timedelta
$execute unless score loops ftemp matches 0 store result storage fxn:schedule list[$(index)].gametime int 1 run scoreboard players operation scheduletime ftemp += gametime ftemp

#move and delete command from list if loops = 0
$data modify storage fxn:schedule current set from storage fxn:schedule list[$(index)]
$execute if score loops ftemp matches 0 run data remove storage fxn:schedule list[$(index)]

#>run command
function fxn:command/handle with storage fxn:schedule current

