#tellraw a rotate command at the position
#return -
#with {x, y, z, r0, schem}

$tellraw @s ["[schematic] ", {text:"particle",color:gold,click_event:{action:"run_command",command:\
    'execute positioned $(x) $(y) $(z) run function schem:rotate {r0:$(r0), text:0, mode:particle, schem:$(schem)}'}}, \
    " | ", {text:"confirm",color:light_purple,click_event:{action:"run_command",command:\
    'execute positioned $(x) $(y) $(z) run function schem:rotate {r0:$(r0), text:0, mode:setblock, schem:$(schem)}'}}]
