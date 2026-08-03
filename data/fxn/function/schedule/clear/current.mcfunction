#clears the currently run schedule
#


#check if not already deleted (must have loops)
execute if score loops ftemp matches 0 run return fail
#check valid ref HUGE ERROR
execute unless data storage fxn:array {cmd:{namespace:"storage fxn:schedule list"}} run return run say fxn:clear/current not referencing schedule array!
#else remove
return run function fxn:array/delete/macro with storage fxn:array cmd
