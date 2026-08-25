#deletes a random value in the pathed array
#return -
#with {path}


#sizeof
$execute store result storage fxn:array rand.i int 1 run function fxn:array/sizeof {path:"$(path)"}
#rand
execute store result score rand ftemp run function fxn:utils/rand with storage fxn:array rand

#>delete
$function fxn:array/cmd {i:0, path:"$(path)", cmd:'execute if score i ftemp = rand ftemp run scoreboard players set code ftemp -122'}
