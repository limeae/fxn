#rotate blockstate
#


#

#>switch
scoreboard players reset rotate temp
#axis
execute store result score rotate temp if block ~ ~ ~ #tool:facing[axis=x] run return run data modify storage tool:block list append value "axis=z"
execute store result score rotate temp if block ~ ~ ~ #tool:facing[axis=z] run return run data modify storage tool:block list append value "axis=x"
#facing
execute store result score rotate temp if block ~ ~ ~ #tool:facing[facing=north] run return run data modify storage tool:block list append value "facing=east"
execute store result score rotate temp if block ~ ~ ~ #tool:facing[facing=east] run return run data modify storage tool:block list append value "facing=south"
execute store result score rotate temp if block ~ ~ ~ #tool:facing[facing=south] run return run data modify storage tool:block list append value "facing=west"
execute store result score rotate temp if block ~ ~ ~ #tool:facing[facing=west] run return run data modify storage tool:block list append value "facing=north"

#>unused
#rotation
