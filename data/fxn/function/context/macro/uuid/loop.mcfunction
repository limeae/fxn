#converts score "int ftemp" to storage fxn:context {uuid.{0,1,...,7}}
#with fxn:context uuid {prefix BYTE, int UUID[0], decrement--}


#
#maths
scoreboard players operation digit ftemp = int ftemp
$execute store result storage fxn:context uuid.$(prefix)$(decrement) int 1 run scoreboard players operation digit ftemp %= 16 ftemp
#convert base 10 value to hexadecimal
$function fxn:context/macro/uuid/hexa {namespace:"storage fxn:context uuid.$(prefix)$(decrement)"}
#end if 0 ran
execute if score decrement ftemp matches 0 run return fail

#else go down a digit
scoreboard players operation int ftemp /= 16 ftemp
#decrement--
execute store result storage fxn:context uuid.decrement int 1 run scoreboard players remove decrement ftemp 1
#loops
function fxn:context/macro/uuid/loop with storage fxn:context uuid
