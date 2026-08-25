#rotate the region 90*
#with {dx, dy, dz}

#90*

#
#rotate blockstates
$function fxn:fill/cmd {dx:$(dx), dy:$(dy), dz:$(dz), order:[dz,dx,dy], command: 'function fxn:list/free {list:[ \
    "function tool:macro/facing {from:north,to:east}", "function tool:macro/facing {from:east,to:south}", \
    "function tool:macro/facing {from:south,to:west}", "function tool:macro/facing {from:west,to:north}"]}'}


