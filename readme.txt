This is an explanation of fxn.zip, by myramyr (github 'limeae')
------

Overview:
This datapack aims to add support for array operations, lists of commands, command contexts
and commands scheduled in the future, as well as some clone and waypoint functionality

------

Vanilla Minecraft:
1. Minecraft runs at 20 ticks per second, where each tick runs all necessary game updates.
	This datapack uses ticks instead of seconds (just multiply by 20).
2. A "path" is any position in Minecraft's data referrable by the data command. Ex:
	"storage draft:draft example.data", "entity @p Health"
3. Macros are variables put into the function command which replace any place in the function they are referenced. Ex:
	/function fxn:cmd {cmd:"summon warden"}
	where fxn:cmd contains | return run $(cmd)
	then the command ran will be: "return run summon warden"
	note that macros can be provided from a path: /function fxn:cmd with storage draft:draft example.data
	but not both a path and specified macros (except with fxn:merge and fxn:merge&)
4. Minecraft runs commands with contexts: {the entity's uuid (or 'Server' or a command block '@' ), x, y, z, rot0, rot1, dimension}
	where commands ran as the player use the player's uuid and position data,
	but commands ran as the server (and by /schedule) run as 'Server', at 0 0 0 0 0 overworld
	fxn:handle/* and fxn:schedule manually get, set, and store these contexts for future use
	fxn:context/* get these contexts (using interesting methods, please read each function)

tl;dr fxn:schedule can schedule commands as an entity at a position, unlike /schedule
------

Functions:

Fxn:
Array:
	general functions for arrays
fxn:array runs a command for every value in an array, after copying the value and i
fxn:array/delete/rand deletes a random entry in the pathed array
fxn:array/delete/clamp deletes random entries in the pathed array until the max is reached
fxn:array/append appends the from array to the to array
fxn:array/sizeof gets the size of the pathed array, with an array with 1 entry having a size of 0
fxn:array/if runs the command for each entry in the pathed ar that matches the values

Context:
	saves contexts to the path
fxn:context/player saves the current player's nickname to the path (from mojang servers)
fxn:context/pos saves the current position [x, y, z, r0, r1, dim] to the path
fxn:context/uuid saves the current entity's hyphenated hexadecimal uuid to the path

Handle:
	runs commands with contexts
fxn:handle/path runs the command with all provided contexts in the path, where the defaults are automatically set
fxn:handle/handle runs the command with all contexts, splitting into ((uuid|no uuid) | (storage|no storage) | (dimension|no dim))
fxn:handle/create creates a command handle with all provided contexts to the path

Key:
	saves commands to protected storage
fxn:key runs the command after saving it to storage, also allowing the command to be a handle or a list of commands
fxn:key/fxn runs a function (that has a cmd macro) with the saved command inside

Schedule:
	schedules (and clears) commands to be ran in the future with provided contexts
fxn:schedule schedules the command after the timedelta has elapsed with all provided contexts and other, for n loops
fxn:schedule/reuse schedules the command after the timedelta has elapsed with all provided contexts and reuses old contexts, for n loops


fxn:cmd runs the command
fxn:for runs a command for every value between the start and end values, with i
fxn:merge& runs the function with the path's macros and the specified macros combined as a copy
fxn:merge runs the function with the path's macros and the specified macros combined at the path

tl;dr use fxn:schedule to schedule commands in the future
	use fxn:key to run a list of commands
	use fxn:array or fxn:for to run array and for loops
	use fxn:context/* to get the entities position and uuid
------

Region:

region:fill runs a command at every block in the region
region:fill^ runs a command at every offset in a direction
region:clone clones the block region to the equivalent region
region:move clone replace moves the block region to the equivalent region
region:undo/move clone replace moves the equivalent region to the block region
region:interpolate moves the block region to the equivalent region with a series of delayed clones up to the provided timedelta

tl;dr use region:fill to run commands in the region
	use region:interpolate to make stuff move
------

Waypoint:
	set waypoints in a group at any position to teleport or operate on
waypoint:book gives the player a book with all waypoints in the group
waypoint:particle toggles the player's particles for the group
waypoint:remove removes the named entry from the group
waypoint:set adds the named entry at the current position to the group, with color
waypoint:tp teleports the entity to the named entry's position

tl;dr make a group name, use waypoint:set to create waypoints and waypoint:book to tp and remove waypoints