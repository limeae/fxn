#get the current entity's hyphenated hexadecimal uuid
#return (0 no entity | 1 entity)
#with {path}

#no @s ERROR
execute unless entity @s run return 0


scoreboard players set 16 fxn 16

#separate UUID[0], ... [3]
execute store result score uuid fxn run data get entity @s UUID[0]
function fxn:context/uuid/char {hash:"00"}
function fxn:context/uuid/char {hash:"01"}
function fxn:context/uuid/char {hash:"02"}
function fxn:context/uuid/char {hash:"03"}
function fxn:context/uuid/char {hash:"04"}
function fxn:context/uuid/char {hash:"05"}
function fxn:context/uuid/char {hash:"06"}
function fxn:context/uuid/char {hash:"07"}
execute store result score uuid fxn run data get entity @s UUID[1]
function fxn:context/uuid/char {hash:"10"}
function fxn:context/uuid/char {hash:"11"}
function fxn:context/uuid/char {hash:"12"}
function fxn:context/uuid/char {hash:"13"}
function fxn:context/uuid/char {hash:"14"}
function fxn:context/uuid/char {hash:"15"}
function fxn:context/uuid/char {hash:"16"}
function fxn:context/uuid/char {hash:"17"}
execute store result score uuid fxn run data get entity @s UUID[2]
function fxn:context/uuid/char {hash:"20"}
function fxn:context/uuid/char {hash:"21"}
function fxn:context/uuid/char {hash:"22"}
function fxn:context/uuid/char {hash:"23"}
function fxn:context/uuid/char {hash:"24"}
function fxn:context/uuid/char {hash:"25"}
function fxn:context/uuid/char {hash:"26"}
function fxn:context/uuid/char {hash:"27"}
execute store result score uuid fxn run data get entity @s UUID[3]
function fxn:context/uuid/char {hash:"30"}
function fxn:context/uuid/char {hash:"31"}
function fxn:context/uuid/char {hash:"32"}
function fxn:context/uuid/char {hash:"33"}
function fxn:context/uuid/char {hash:"34"}
function fxn:context/uuid/char {hash:"35"}
function fxn:context/uuid/char {hash:"36"}
function fxn:context/uuid/char {hash:"37"}

#concatenate into string
function fxn:context/uuid/concat with storage fxn:context uuid

#send to PATH
$data modify $(path) set from storage fxn:context uuid.concat


#/!\ maybe delete the temp storage after
return 1