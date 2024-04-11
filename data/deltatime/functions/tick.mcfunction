execute store result score b deltatime run worldborder get
tellraw @a[tag=debugtick1] "\n\n------------------------------------------"
tellraw @a[tag=debugtick1] ["border: ",{"score":{"name": "b","objective": "deltatime"}}]
# defaults
# max: 6000000
# min: 5000000

# max worldborder
execute in minecraft:overworld run worldborder set 6000000

# min worldborder
execute in minecraft:overworld run worldborder set 5000000 5

# max worldborder
scoreboard players set a deltatime 6000000

# min worldborder
scoreboard players remove a deltatime 5000000
scoreboard players remove b deltatime 5000000

tellraw @a[tag=debugtick1] ["1: a: ",{"score":{"name": "a","objective": "deltatime"}}," b: ",{"score":{"name": "b","objective": "deltatime"}}]

# a = 100 000 (max)
# b = 9 000 (current)

#scoreboard players operation b deltatime *= accuracy deltatime
scoreboard players operation a deltatime /= accuracy deltatime
scoreboard players operation b deltatime /= a deltatime

tellraw @a[tag=debugtick1] ["2: b: ",{"score":{"name": "b","objective": "deltatime"}}," "]
# b = 9 (%)

scoreboard players operation a deltatime = accuracy deltatime
scoreboard players operation a deltatime -= b deltatime

tellraw @a[tag=debugtick1] ["3: a: ",{"score":{"name": "a","objective": "deltatime"}}," (obrátené)"]
# a = 91 (%)

scoreboard players operation a deltatime *= 5 deltatime

tellraw @a[tag=debugtick1] ["4: a: ",{"score":{"name": "a","objective": "deltatime"}}," cs"]

tellraw @a[tag=debugtick1] ["5: buffer: ",{"score":{"name": "buffer","objective": "deltatime"}}]
# a = 455 (cs) (4,55 s) (ms*10)

scoreboard players operation tickdelta deltatime = a deltatime
scoreboard players operation buffer deltatime += a deltatime

scoreboard players operation b deltatime = buffer deltatime
# b = 455
scoreboard players set a deltatime 20
scoreboard players operation b deltatime *= a deltatime
scoreboard players operation b deltatime /= accuracy deltatime
scoreboard players operation tickstoadd deltatime = b deltatime

tellraw @a[tag=debugtick1] ["6: tickstoadd: ",{"score":{"name": "b","objective": "deltatime"}}]

# (tickdelta = 227,5)
# tickdelta = 227
# buffer = 455 - 227 * 2 = 1
# tickstoadd = 91

scoreboard players operation b deltatime *= accuracy deltatime
scoreboard players operation b deltatime /= a deltatime
scoreboard players operation buffer deltatime -= b deltatime

tellraw @a[tag=debugtick1] ["7: buffer: ",{"score":{"name": "b","objective": "deltatime"}}]

tellraw @a[tag=debugtick] ["tickdelta: ",{"score":{"name": "tickdelta","objective": "deltatime"}}," tickstoadd: ",{"score":{"name": "tickstoadd","objective": "deltatime"}}," buffer: ",{"score":{"name": "buffer","objective": "deltatime"}}]
