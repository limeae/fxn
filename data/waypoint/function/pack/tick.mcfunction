#runs every tick


#


#particles
execute if score 3 ftemp matches 0 if score 4 ftemp matches 0 run \
    function fxn:array {path:'storage waypoint:master list', cmd:'function waypoint:particle/group with storage fxn:array', i:0}

