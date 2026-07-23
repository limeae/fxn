#runs every tick
#

#bunch of periodics | max combination is 60
scoreboard players add 2 ftemp 1
execute if score 2 ftemp matches 2.. run scoreboard players set 2 ftemp 0
scoreboard players add 3 ftemp 1
execute if score 3 ftemp matches 3.. run scoreboard players set 3 ftemp 0
scoreboard players add 4 ftemp 1
execute if score 4 ftemp matches 4.. run scoreboard players set 4 ftemp 0
scoreboard players add 5 ftemp 1
execute if score 5 ftemp matches 5.. run scoreboard players set 5 ftemp 0


#
#get gametime -> 'score gametime ftemp', 'storage fxn:schedule gametime'
execute store result score gametime ftemp run time query gametime

#run schedule/tick
function fxn:schedule/tick


