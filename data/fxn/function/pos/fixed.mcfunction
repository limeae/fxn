#runs 'command' at provided xyz
#with storage fxn:fill pos {x, y, z, command}


#run at delta-position
$execute positioned $(x) $(y) $(z) run return run $(command)
