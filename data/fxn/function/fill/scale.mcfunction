#runs 'command' at each block (scaled) inside of xyz region
#with {dx, dy, dz, order[], scale, command}

#>ordered: [dz, dy, dx] outer -> inner
#or [z, y, x]
#>scale multiplies the offsets, so scale:2 would run every 2 blocks


#save command to pos
$data modify storage fxn:fill pos.command set value '$(command)'
#save order to storage
$data modify storage fxn:fill cmd.order set value $(order)
#default dxyz
data modify storage fxn:fill pos.dx set value 0
data modify storage fxn:fill pos.dy set value 0
data modify storage fxn:fill pos.dz set value 0

#appending nest entries manually
data remove storage fxn:fill cmd.nest
#0
data remove storage fxn:fill matches
data modify storage fxn:fill matches set from storage fxn:fill cmd.order[0]
$execute if data storage fxn:fill {matches:x} run data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dx int $(scale) run scoreboard players get i ftemp",start:0,end:$(dx)}
$execute if data storage fxn:fill {matches:dx} run data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dx int $(scale) run scoreboard players get i ftemp",start:0,end:$(dx)}
$execute if data storage fxn:fill {matches:y} run data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dy int $(scale) run scoreboard players get i ftemp",start:0,end:$(dy)}
$execute if data storage fxn:fill {matches:dy} run data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dy int $(scale) run scoreboard players get i ftemp",start:0,end:$(dy)}
$execute if data storage fxn:fill {matches:z} run data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dz int $(scale) run scoreboard players get i ftemp",start:0,end:$(dz)}
$execute if data storage fxn:fill {matches:dz} run data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dz int $(scale) run scoreboard players get i ftemp",start:0,end:$(dz)}
#1
data remove storage fxn:fill matches
data modify storage fxn:fill matches set from storage fxn:fill cmd.order[1]
$execute if data storage fxn:fill {matches:x} run data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dx int $(scale) run scoreboard players get i ftemp",start:0,end:$(dx)}
$execute if data storage fxn:fill {matches:dx} run data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dx int $(scale) run scoreboard players get i ftemp",start:0,end:$(dx)}
$execute if data storage fxn:fill {matches:y} run data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dy int $(scale) run scoreboard players get i ftemp",start:0,end:$(dy)}
$execute if data storage fxn:fill {matches:dy} run data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dy int $(scale) run scoreboard players get i ftemp",start:0,end:$(dy)}
$execute if data storage fxn:fill {matches:z} run data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dz int $(scale) run scoreboard players get i ftemp",start:0,end:$(dz)}
$execute if data storage fxn:fill {matches:dz} run data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dz int $(scale) run scoreboard players get i ftemp",start:0,end:$(dz)}
#2
data remove storage fxn:fill matches
data modify storage fxn:fill matches set from storage fxn:fill cmd.order[2]
$execute if data storage fxn:fill {matches:x} run data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dx int $(scale) run scoreboard players get i ftemp",start:0,end:$(dx)}
$execute if data storage fxn:fill {matches:dx} run data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dx int $(scale) run scoreboard players get i ftemp",start:0,end:$(dx)}
$execute if data storage fxn:fill {matches:y} run data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dy int $(scale) run scoreboard players get i ftemp",start:0,end:$(dy)}
$execute if data storage fxn:fill {matches:dy} run data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dy int $(scale) run scoreboard players get i ftemp",start:0,end:$(dy)}
$execute if data storage fxn:fill {matches:z} run data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dz int $(scale) run scoreboard players get i ftemp",start:0,end:$(dz)}
$execute if data storage fxn:fill {matches:dz} run data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dz int $(scale) run scoreboard players get i ftemp",start:0,end:$(dz)}

#append command macro
data modify storage fxn:fill cmd.nest append value {command:'function fxn:fill/macro/pos with storage fxn:fill pos',start:0,end:0}


#>run nest with our generated nest
function fxn:for/nest with storage fxn:fill cmd
