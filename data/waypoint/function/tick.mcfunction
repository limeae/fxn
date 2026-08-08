#runs every tick


#


#particles
execute if score 3 ftemp matches 0 if score 4 ftemp matches 0 run \
    function fxn:array/cmd {namespace:"storage waypoint:master list", command:"function waypoint:particle/group with storage fxn:matches"}

