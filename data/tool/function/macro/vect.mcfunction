#rotate and scale the block
#with storage fxn:fill pos {dx, dy, dz, sx, sy, sz, r0, r1, offset, args}


#
$clone ^$(dx) ^$(dy) ^$(dz) ^$(dx) ^$(dy) ^$(dz) to tool:view 0 319 0$(args)
$execute positioned $(offset) rotated $(r0) $(r1) run clone from tool:view 0 319 0 0 319 0 to tool:view ^$(sx) ^$(sy) ^$(sz)$(args)
