#runs every gametick (20tps)
#runs after advancement calls, enchantment calls
#



#gametime
execute store result score gametime fxn run time query gametime


#ANY JOIN: join == 1
#FIRST JOIN: join == 1 && leave != 1
#REJOIN: join == 1 && leave == 1
scoreboard players reset @a[scores={fxn.leave = 1.., fxn.join = 2}] fxn.leave
scoreboard players add @a fxn.join 1
scoreboard players set @a[scores={fxn.leave = 1..}] fxn.join 1


#run schedule list
function fxn:tick/schedule {i:0}
