#converts score "int ftemp" to storage fxn:context {uuid.{0,1,...,7}}
#return -
#with fxn:context uuid {prefix BYTE, int UUID[0], i--}


#
#maths
scoreboard players operation digit ftemp = int ftemp
$execute store result storage fxn:context uuid.$(prefix)$(i) int 1 run scoreboard players operation digit ftemp %= 16 ftemp
#convert base 10 value to hexadecimal
$function fxn:context/macro/uuid/hexa {path:"storage fxn:context uuid.$(prefix)$(i)"}
#end if 0 ran
execute if score i ftemp matches 0 run return fail

#else go down a digit
scoreboard players operation int ftemp /= 16 ftemp
#i--
execute store result storage fxn:context uuid.i int 1 run scoreboard players remove i ftemp 1
#loops
function fxn:context/macro/uuid/loop with storage fxn:context uuid
