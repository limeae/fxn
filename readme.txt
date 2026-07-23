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

Context:
	saves contexts to the namespace
fxn:context/block saves the block at the current position to the namespace
fxn:context/player saves the current player's nickname to the namespace (from mojang servers)
fxn:context/pos_int saves the current position [x, y, z, r0, r1, dim] as integers to the namespace
fxn:context/pos saves the current position [x, y, z, r0, r1, dim] as doubles to the namespace
fxn:context/uuid saves the current entity's hyphenated hexadecimal uuid to the namespace

Schedule:
	schedules (and clears) commands to be ran in the future with provided contexts
fxn:schedule schedules the command after the timedelta has elapsed with all provided contexts and other, for n loops
fxn:schedule/clear clears all scheduled commands
fxn:schedule/clear/ifs clears all scheduled commands that meet every provided if statement

fxn:command runs the command
fxn:raycast runs the command forward at given intervals with a maximum iterations
fxn:list runs the provided list of commands in order

tl;dr use fxn:schedule to schedule commands in the future
------

Tool:
Select:
	select a region of blocks and another equivalent region for various clone commands
tool:

Op(eration):
