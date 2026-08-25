#changes values 10-15 to digit letters to $(path)
#return -
#with {path}


#
#get path
$execute store result score digit ftemp run data get $(path)
#return hexadecimal if different
$execute if score digit ftemp matches 10 run return run data modify $(path) set value "a"
$execute if score digit ftemp matches 11 run return run data modify $(path) set value "b"
$execute if score digit ftemp matches 12 run return run data modify $(path) set value "c"
$execute if score digit ftemp matches 13 run return run data modify $(path) set value "d"
$execute if score digit ftemp matches 14 run return run data modify $(path) set value "e"
$execute if score digit ftemp matches 15 run return run data modify $(path) set value "f"
#fail if over 16
execute unless score digit ftemp matches 0..15 run return fail
