#generate a book with the specified region
#return -
#with {x, y, z, dx, dy, dz}


#reset
$data modify storage schem:save schem set value [$(dx),$(dy),$(dz)]
#fill loop
$execute positioned $(x) $(y) $(z) run function fxn:fill {x:$(dx), y:$(dy), z:$(dz), cmd:'function schem:book/save'}

#summon book
function schem:book/book with storage schem:save
