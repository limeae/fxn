#run a command at a directional xyz
#return -
#with storage region:cmd {x, y, z, cmd}
#context xyz r0r1 dim

$execute positioned ^$(x) ^$(y) ^$(z) run $(cmd)
