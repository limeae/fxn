#run a command for every dxyz
#with {dx, dy, dz, command}

#merge goes to storage fxn:fill pos
#same with current dxyz


#default dxyz
data modify storage fxn:fill pos.dx set value 0
data modify storage fxn:fill pos.dy set value 0
data modify storage fxn:fill pos.dz set value 0
#append nest entries [zxy]
data remove storage fxn:fill cmd.nest
$data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dz int 1 run scoreboard players get i ftemp",start:0,end:$(dz)}
$data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dx int 1 run scoreboard players get i ftemp",start:0,end:$(dx)}
$data modify storage fxn:fill cmd.nest append value {command:"execute store result storage fxn:fill pos.dy int 1 run scoreboard players get i ftemp",start:0,end:$(dy)}

#append function 
#>recommended 'with storage fxn:fill pos'
$data modify storage fxn:fill cmd.nest append value {command:'$(command)',start:0,end:0}

#run nest with our generated nest
#function fxn:for/nest with storage fxn:fill cmd
