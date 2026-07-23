#spawns the box of particles
#with {x, y, z, dx, dy, dz, qx, qy, qz}


#
#x1,y1,z1 east
$execute positioned $(x) $(y) $(z) positioned ~$(qx) ~$(qy) ~$(qz) positioned ~-0.5 ~ ~-0.5 rotated -90 0 run function tool:particle/qloop {decrement:$(dx)}
#x1,y1,z1 south
$execute positioned $(x) $(y) $(z) positioned ~$(qx) ~$(qy) ~$(qz) positioned ~-0.5 ~ ~-0.5 rotated 0 0 run function tool:particle/qloop {decrement:$(dz)}
#x1,y1,z1 up
$execute positioned $(x) $(y) $(z) positioned ~$(qx) ~$(qy) ~$(qz) positioned ~-0.5 ~ ~-0.5 rotated 0 -90 run function tool:particle/qloop {decrement:$(dy)}

#x2,y1,z2 west
$execute positioned $(x) $(y) $(z) positioned ~$(qx) ~$(qy) ~$(qz) positioned ~0.5 ~ ~0.5 positioned ~$(dx) ~ ~$(dz) rotated 90 0 run function tool:particle/qloop {decrement:$(dx)}
#x2,y1,z2 north
$execute positioned $(x) $(y) $(z) positioned ~$(qx) ~$(qy) ~$(qz) positioned ~0.5 ~ ~0.5 positioned ~$(dx) ~ ~$(dz) rotated -180 0 run function tool:particle/qloop {decrement:$(dz)}
#x2,y1,z2 up
$execute positioned $(x) $(y) $(z) positioned ~$(qx) ~$(qy) ~$(qz) positioned ~0.5 ~ ~0.5 positioned ~$(dx) ~ ~$(dz) rotated 0 -90 run function tool:particle/qloop {decrement:$(dy)}

#x1,y2,z2 east
$execute positioned $(x) $(y) $(z) positioned ~$(qx) ~$(qy) ~$(qz) positioned ~-0.5 ~1 ~0.5 positioned ~ ~$(dy) ~$(dz) rotated -90 0 run function tool:particle/qloop {decrement:$(dx)}
#x1,y2,z2 north
$execute positioned $(x) $(y) $(z) positioned ~$(qx) ~$(qy) ~$(qz) positioned ~-0.5 ~1 ~0.5 positioned ~ ~$(dy) ~$(dz) rotated -180 0 run function tool:particle/qloop {decrement:$(dz)}
#x1,y2,z2 down
$execute positioned $(x) $(y) $(z) positioned ~$(qx) ~$(qy) ~$(qz) positioned ~-0.5 ~1 ~0.5 positioned ~ ~$(dy) ~$(dz) rotated 0 90 run function tool:particle/qloop {decrement:$(dy)}

#x2,y2,z1 west
$execute positioned $(x) $(y) $(z) positioned ~$(qx) ~$(qy) ~$(qz) positioned ~0.5 ~1 ~-0.5 positioned ~$(dx) ~$(dy) ~ rotated 90 0 run function tool:particle/qloop {decrement:$(dx)}
#x2,y2,z1 south
$execute positioned $(x) $(y) $(z) positioned ~$(qx) ~$(qy) ~$(qz) positioned ~0.5 ~1 ~-0.5 positioned ~$(dx) ~$(dy) ~ rotated 0 0 run function tool:particle/qloop {decrement:$(dz)}
#x2,y2,z1 down
$execute positioned $(x) $(y) $(z) positioned ~$(qx) ~$(qy) ~$(qz) positioned ~0.5 ~1 ~-0.5 positioned ~$(dx) ~$(dy) ~ rotated 0 90 run function tool:particle/qloop {decrement:$(dy)}
