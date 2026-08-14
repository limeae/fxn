#clones the region from tool:view to dim
#with {dx, dy, dz, args}

#clones into current dim
#>args: "strict masked" (for clone) whitespace beforehand!!

#
#forceload
$execute in tool:view run forceload add ~ ~ ~$(dx) ~$(dz)

#clone
$clone from tool:view ~ ~ ~ ~$(dx) ~$(dy) ~$(dz) ~ ~ ~$(args)


execute in tool:view run forceload remove all
#
