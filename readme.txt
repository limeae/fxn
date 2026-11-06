This is an explanation of fxn.zip, by myramyr (github 'limeae')
------

Overview:
This datapack aims to add support for scheduling commands

------

Vanilla Minecraft:
1. Minecraft runs at 20 ticks per second, where each tick runs all necessary game updates.
	This datapack references ticks only.
2. A "path" is any position in Minecraft's data referrable by the data command. Ex:
	"storage draft:draft example.data" | "block ~ ~1 ~ item" | "entity @p Health"
3. Macros are variables put into the function command which replace any place in the function they are referenced. Ex:
	/function fxn:summon {entity:"warden"}
	where fxn:cmd contains | summon $(entity)
	then the command ran will be: "summon warden"
	note that macros can be provided from a path: /function fxn:summon with storage draft:draft example.data
4. Minecraft runs commands with contexts: {the entity's uuid (or 'Server' or a command block '@' ), x, y, z, r0, r1, dimension}
	where commands ran as the player use the player's uuid and position data,
	but commands ran as the server (and by /schedule) run as 'Server', at 0 0 0 0 0 overworld
	fxn:schedule adds support for scheduling commands with uuid and position

tl;dr fxn:schedule can schedule commands as an entity at a position, unlike /schedule
------

Functions:

Fxn:
Context:
	saves contexts to the path
fxn:context/player saves the current player's nickname to the path (from mojang servers)
fxn:context/pos saves the current position [x, y, z, r0, r1, dim, ( | double)] to the path as integers or doubles
fxn:context/uuid saves the current entity's hyphenated hexadecimal uuid to the path

Schedule:
fxn:schedule schedules the command after the timedelta has elapsed with all provided contexts, for n loops
