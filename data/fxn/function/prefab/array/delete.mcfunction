#delete a value in an array
#return -
#with storage fxn:array {path, i}
#context -

$data remove $(path)[$(i)]
#add to delete ftemp as well
scoreboard players add delete ftemp 1
