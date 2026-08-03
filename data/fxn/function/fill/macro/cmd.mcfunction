#loops the provided axis from start to end
#with storage fxn:fill cmd {dx, dy, dz POSITIVE, temp, order[], command}

#>ordered: [z, y, x] outer -> inner

#delete order[0]
data remove storage fxn:fill cmd.order[0]
#loop z, then x, then y
$function fxn:for/cmd {start:$(z),end:{delta:$(dz)},command:'function fxn:list {list: ["execute store result storage fxn:fill cmd.z int 1 run scoreboard players get i ftemp", "$(command)"]}'}

