#loop within o1 values
#return -
#with {o1, o2, c1p, c1n}

function strt:fill/2 with storage strt:temp fill

#o1 ++ || -- || break
$execute if score $(o1) fxn matches 0 run return fail
scoreboard players set sgn fxn 1
$execute if score $(o1) fxn matches ..0 run scoreboard players set sgn fxn -1
$scoreboard players operation $(o1) fxn -= sgn fxn

#run ++ || --
$scoreboard players operation $(o2) fxn = m$(o2) fxn

$execute if score sgn fxn matches 1 positioned $(c1p) run return run function strt:fill/1 with storage strt:temp fill
$execute if score sgn fxn matches -1 positioned $(c1n) run return run function strt:fill/1 with storage strt:temp fill
