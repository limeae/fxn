#loop within o2 values
#return -
#with {o2, c2p, c2n}

function fxn:cmd with storage strt:temp fill

#o2 ++ || -- || break
$execute if score $(o2) fxn matches 0 run return fail
scoreboard players set sgn fxn 1
$execute if score $(o2) fxn matches ..0 run scoreboard players set sgn fxn -1
$scoreboard players operation $(o2) fxn -= sgn fxn

#run ++ || --


$execute if score sgn fxn matches 1 positioned $(c2p) run return run function strt:fill/2 with storage strt:temp fill
$execute if score sgn fxn matches -1 positioned $(c2n) run return run function strt:fill/2 with storage strt:temp fill
