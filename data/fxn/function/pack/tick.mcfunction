#tick


#gametime
execute store result score gametime ftemp run time query gametime

#schedule runner
function fxn:array/cmd {path:"storage fxn:schedule list", cmd:'function fxn:schedule/run with storage fxn:array', i:0}


