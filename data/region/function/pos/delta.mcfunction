#run a command at a delta xyz
#return -
#with storage region:cmd {x, y, z, cmd}
#context xyz dim

$execute positioned ~$(x) ~$(y) ~$(z) run $(cmd)
