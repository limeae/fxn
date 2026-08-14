#applies scales to dxyz -> sxyz
#with {sx, sy, sz}


#
$execute store result storage fxn:fill pos.sx int $(sx) run data get storage fxn:fill pos.dx
$execute store result storage fxn:fill pos.sy int $(sy) run data get storage fxn:fill pos.dy
$execute store result storage fxn:fill pos.sz int $(sz) run data get storage fxn:fill pos.dz
