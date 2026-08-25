#save blockstate and data
#


#
#data
data modify storage tool:block data set from block ~ ~ ~

#>other blockstates
#waterlogged
execute if block ~ ~ ~ #tool:facing[waterlogged=true] run data modify storage tool:block list append value "waterlogged=true"
#face
execute if block ~ ~ ~ #tool:facing[face=floor] run data modify storage tool:block list append value "face=floor"
execute if block ~ ~ ~ #tool:facing[face=wall] run data modify storage tool:block list append value "face=wall"
execute if block ~ ~ ~ #tool:facing[face=ceiling] run data modify storage tool:block list append value "face=ceiling"
#shape
execute if block ~ ~ ~ #tool:facing[shape=straight] run data modify storage tool:block list append value "shape=straight"
execute if block ~ ~ ~ #tool:facing[shape=inner_left] run data modify storage tool:block list append value "shape=inner_left"
execute if block ~ ~ ~ #tool:facing[shape=inner_right] run data modify storage tool:block list append value "shape=inner_right"
execute if block ~ ~ ~ #tool:facing[shape=outer_left] run data modify storage tool:block list append value "shape=outer_left"
execute if block ~ ~ ~ #tool:facing[shape=outer_right] run data modify storage tool:block list append value "shape=outer_right"
#type
execute if block ~ ~ ~ #tool:facing[type=top] run data modify storage tool:block list append value "type=top"
execute if block ~ ~ ~ #tool:facing[type=double] run data modify storage tool:block list append value "type=double"

#>unused
#rotation
#powered
#conditional
#delay
#extended
#half
#hinge
#open
