#changes values 10-15 to digit letters to $(namespace)
#with {namespace}


#
#get namespace
$execute store result score digit ftemp run data get $(namespace)
#return hexadecimal if different
$execute if score digit ftemp matches 10 run return run data modify $(namespace) set value "a"
$execute if score digit ftemp matches 11 run return run data modify $(namespace) set value "b"
$execute if score digit ftemp matches 12 run return run data modify $(namespace) set value "c"
$execute if score digit ftemp matches 13 run return run data modify $(namespace) set value "d"
$execute if score digit ftemp matches 14 run return run data modify $(namespace) set value "e"
$execute if score digit ftemp matches 15 run return run data modify $(namespace) set value "f"
#fail if over 16
execute unless score digit ftemp matches 0..15 run return fail
