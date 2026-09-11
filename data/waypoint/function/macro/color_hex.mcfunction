#convert color array to color_hex
#
say macro/color_hex
scoreboard players set 16 ftemp 16

#
#RED
execute store result score concat_0 ftemp store result score concat_1 ftemp run data get storage waypoint:matches merge.color[0] 255
#maths
execute store result storage waypoint:matches color.concat.0 int 1 run scoreboard players operation concat_0 ftemp /= 16 ftemp
function fxn:context/macro/uuid/hexa {path:'storage waypoint:matches color.concat.0'}
execute store result storage waypoint:matches color.concat.1 int 1 run scoreboard players operation concat_1 ftemp %= 16 ftemp
function fxn:context/macro/uuid/hexa {path:'storage waypoint:matches color.concat.1'}
#concat
data modify storage waypoint:matches color.concat.path set value "storage waypoint:matches color.0"
function waypoint:macro/concat with storage waypoint:matches color.concat

#GREEN
execute store result score concat_0 ftemp store result score concat_1 ftemp run data get storage waypoint:matches merge.color[1] 255
#maths
execute store result storage waypoint:matches color.concat.0 int 1 run scoreboard players operation concat_0 ftemp /= 16 ftemp
function fxn:context/macro/uuid/hexa {path:'storage waypoint:matches color.concat.0'}
execute store result storage waypoint:matches color.concat.1 int 1 run scoreboard players operation concat_1 ftemp %= 16 ftemp
function fxn:context/macro/uuid/hexa {path:'storage waypoint:matches color.concat.1'}
#concat
data modify storage waypoint:matches color.concat.path set value "storage waypoint:matches color.1"
function waypoint:macro/concat with storage waypoint:matches color.concat

#RED x GREEN
data modify storage waypoint:matches color.path set value "storage waypoint:matches color.0"
function waypoint:macro/concat with storage waypoint:matches color

#BLUE
execute store result score concat_0 ftemp store result score concat_1 ftemp run data get storage waypoint:matches merge.color[2] 255
#maths
execute store result storage waypoint:matches color.concat.0 int 1 run scoreboard players operation concat_0 ftemp /= 16 ftemp
function fxn:context/macro/uuid/hexa {path:'storage waypoint:matches color.concat.0'}
execute store result storage waypoint:matches color.concat.1 int 1 run scoreboard players operation concat_1 ftemp %= 16 ftemp
function fxn:context/macro/uuid/hexa {path:'storage waypoint:matches color.concat.1'}
#concat
function waypoint:macro/concat with storage waypoint:matches color.concat

#RG x BLUE
data modify storage waypoint:matches color.path set value "storage waypoint:matches merge.color_hex"
function waypoint:macro/concat with storage waypoint:matches color


