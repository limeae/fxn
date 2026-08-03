#runs 'command' at provided dxyz
#with storage fxn:fill pos {dx, dy, dz, command}


#run at delta-position
$execute positioned ~$(dx) ~$(dy) ~$(dz) run $(command)
