#runs on reload
#


#the objective used by all variables
scoreboard objectives add fxn dummy



#join and rejoin scores(see tick)
scoreboard objectives add fxn.join dummy
scoreboard objectives add fxn.leave minecraft.custom:minecraft.leave_game

#reset all players join
#scoreboard players reset @a fxn.join
#scoreboard players reset @a fxn.leave
#data modify storage fxn:main players set value []


