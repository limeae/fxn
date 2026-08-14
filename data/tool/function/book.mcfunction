#give a schematic book
#with ?

#retains schematic {x, y, z, dim, dx, dy, dz, qx, qy, qz, qdim}

#
#EXAMPLE COMMAND
data modify entity @n[type=item] Item.components."minecraft:written_book_content".pages[0] append value \
    {text:"diagonal", click_event:{action:"suggest_command", command:""}}

#load region
$execute in $(dim) positioned $(x) ~ $(z) run forceload add ~ ~ ~$(dx) ~$(dz)
#unload region
$execute in $(dim) positioned $(x) ~ $(z) run forceload remove ~ ~ ~$(dx) ~$(dz)
#load moved
$execute in $(qdim) positioned $(x) ~ $(z) positioned $(qx) ~ $(qz) run forceload add ~ ~ ~$(dx) ~$(dz)
#unload moved
$execute in $(qdim) positioned $(x) ~ $(z) positioned $(qx) ~ $(qz) run forceload remove ~ ~ ~$(dx) ~$(dz)
#load view
$execute in tool:view positioned $(x) ~ $(z) run forceload add ~ ~ ~$(dx) ~$(dz)
#unload view
$execute in tool:view positioned $(x) ~ $(z) run forceload remove ~ ~ ~$(dx) ~$(dz)

#dial
$execute positioned $(x) $(y) $(z) in $(dim) run function tool:dial {dx:$(dx), dy:$(dy), dz:$(dz)}

#move
$execute positioned $(x) $(y) $(z) in $(dim) run clone ~ ~ ~ ~$(dx) ~$(dy) ~$(dz) to $(qdim) ~$(qx) ~$(qy) ~$(qz) strict replace move

