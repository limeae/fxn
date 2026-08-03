#adds path to the next nest entry
#with storage fxn:array cmd {decrement}


#nest.list[0] gets {path:1}
$execute store result storage fxn:for nest.list[$(decrement)].path int 1 run scoreboard players add decrement ftemp 1
