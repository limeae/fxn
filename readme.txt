This is an explanation of fxn.zip, by myramyr (github 'limeae')
------

Overview:
This datapack aims to add support for array operations, lists of commands,
and commands scheduled in the future, as well as some clone functionality

------

Vanilla Minecraft:
1. Minecraft runs at 20 ticks per second, where each tick runs all necessary game updates.
	This datapack uses ticks instead of seconds (just multiply by 20).
2. A "Namespace" is any position in Minecraft's data referrable by the data command. Ex:
	"storage draft:draft example.data", "entity @p Health"
3. Macros are variables put into the function command which replace any place in the function they are referenced. Ex:
	/function fxn:command {command:"summon warden"}
	where fxn:command contains | return run $(command)
	then the command ran will be: "return run summon warden"
	note that macros can be provided from namespaces, but not both (at least easily)
4. Minecraft runs commands with contexts: {the entity's uuid (or 'Server' or '@'), x, y, z, r0, r1, dimension}
	where commands ran as the player use the player's uuid and position data,
	but commands ran as the server (and by /schedule) run as 'Server', at 0 0 0 0 0 overworld
	fxn:command/* and fxn:schedule manually get, set, and store these contexts for future use
	fxn:context/* get these contexts (using interesting methods, please read each function)

------

Functions:

Fxn:
Array:
	general functions for arrays
fxn:array/delete/rand deletes a random entry in the namespaced array
fxn:array/delete/clamp deletes a random entries in the namespaced array until the max is reached
fxn:array/append appends the value to the namespaced array
fxn:array/prepend prepends the value to the namespaced array
fxn:array/cmd runs the command at every entry in the namespaced array
fxn:array/get_max gets the size of the namespaced array, with an array with 1 entry having a size of 0
fxn:array/if_value runs the command for each entry in the namespaced that matches the value

Command:
	runs commands with contexts
fxn:command/merge runs the command with all provided contexts, where the defaults are automatically set
fxn:command/handle runs the command with all contexts, splitting into ((uuid|no uuid) | (storage|no storage))
fxn:command/create creates a command handle with all provided contexts to the namespace
fxn:command/create/reuse creates a command handle with all provided and previously used contexts to the namespace
fxn:command/create appends a command handle with all provided contexts in the namespaced array

Context:
	saves contexts to the namespace
fxn:context/block_id saves the block at the current position to the namespace
fxn:context/player saves the current player's nickname to the namespace (from mojang servers)
fxn:context/pos_int saves the current position [x, y, z, r0, r1, dim] as integers to the namespace
fxn:context/pos saves the current position [x, y, z, r0, r1, dim] as doubles to the namespace
fxn:context/uuid saves the current entity's hyphenated hexadecimal uuid to the namespace

Fill:
fxn:fill/cmd runs a command at every block in the dxdydz rect

For:
fxn:for/cmd runs a command for every value between the start and end values, with score i ftemp
fxn:for/nest runs a nest of for loops

Schedule:
	schedules (and clears) commands to be ran in the future with provided contexts
fxn:schedule schedules the command after the timedelta has elapsed with all provided contexts and other, for n loops
fxn:schedule/clear clears all scheduled commands
fxn:schedule/clear/ifs clears all scheduled commands that meet every provided if statement

For:
	runs a for loop with a command, a start point, and an endpoint
fxn:for/cmd runs the provided command
fxn:for/nest creates a nested loop that runs a command before running the next loop

Fill:
	runs a for loop with x, y, and z used as position offsets
fxn:fill/cmd runs the provided command with dx, dy, dz

fxn:command runs the command
fxn:raycast runs the command forward at given intervals with a maximum iterations
fxn:list runs the provided list of commands and command handles in order, including other lists
fxn:concat concatenates values 0 and 1 to the namespace
fxn:loaded loads the position before running the provided command

tl;dr use fxn:schedule to schedule commands in the future
	use fxn:list to run a list of commands
	use fxn:array/cmd or fxn:for/cmd to run for loops
------

Tool:
Select:
	select a region of blocks and another equivalent region for various clone commands
tool:select runs tool:select/extend at the current position
tool:move runs tool:select/move at the current position
tool:select/extend extends the player's block region to include the provided block
tool:select/move moves the player's equivalent region to include the provided block
tool:select/strict_move moves the player's equivalent region by the provided offset x, y, z
tool:select/particle shows the player box particles for both regions
tool:select/deselect removes the player's region selections

Op(eration):
	operates on a region of blocks and another equivalent region with various clone commands
	note these functions can use the player's regions, or explicity provided x, y, z, dx, dy, dz, qx, qy, qz (and other macros)
tool:op/clone clones the block region to the equivalent region
tool:op/move clone replace moves the block region to the equivalent region
tool:op/undo/move clone replace moves the equivalent region to the block region
tool:op/interpolate moves the block region to the equivalent region with a series of delayed clones up to the provided timedelta

tool:particle/box shows particles for the edges of a box region
tool:kit gives command blocks that run tool:select and tool:move at the placed block

tl;dr use the blue block to extend a region, the pink block to move its copy, and tool:op/move (or clone, or other) to operate on the 2 regions
------

Waypoint:
	set waypoints in a group at any position to teleport or operate on
waypoint:book gives the player a book with all waypoints in the group
waypoint:particle toggles the player's particles for the group
waypoint:remove removes the named entry from the group
waypoint:set adds the named entry at the current position to the group, with color
waypoint:tp teleports the entity to the named entry's position

tl;dr make a group name, use waypoint:set to create waypoints and waypoint:book to tp and remove waypoints