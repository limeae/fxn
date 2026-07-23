#spawn a particle, move in direction until loop ends
#in a direction
#with {decrement--}

scoreboard players add failsafe ftemp 1
execute if score failsafe ftemp matches 999999.. run return run say failsafe active! (/scoreboard players reset failsafe ftemp)

#if -1, end
$scoreboard players set decrement ftemp $(decrement)
execute if score decrement ftemp matches ..-1 run return fail
#else

#
particle dust{color:[0.7,0.7,1],scale:1.5} ~ ~ ~ 0 0 0 0 0 force @s
particle dust{color:[0.7,0.7,1],scale:1.5} ^ ^ ^0.5 0 0 0 0 0 force @s


#decrement-- -> 'storage tool:select particle.decrement'
$scoreboard players set decrement ftemp $(decrement)
execute store result storage tool:select particle.decrement int 1 \
    run scoreboard players remove decrement ftemp 1
#loop in direction {decrement--}
return run execute positioned ^ ^ ^1 run function tool:particle/loop with storage tool:select particle

