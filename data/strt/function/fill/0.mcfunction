#loop within o0 values
#return -
#with {o0, o1, o2, c0p, c0n}

function strt:fill/1 with storage strt:temp fill

#o0 ++ || -- || break
$execute if score $(o0) fxn matches 0 run return fail
scoreboard players set sgn fxn 1
$execute if score $(o0) fxn matches ..0 run scoreboard players set sgn fxn -1
$scoreboard players operation $(o0) fxn -= sgn fxn

#run ++ || --
$scoreboard players operation $(o1) fxn = m$(o1) fxn
$scoreboard players operation $(o2) fxn = m$(o2) fxn
$execute if score sgn fxn matches 1 positioned $(c0p) run return run function strt:fill/0 with storage strt:temp fill
$execute if score sgn fxn matches -1 positioned $(c0n) run return run function strt:fill/0 with storage strt:temp fill
