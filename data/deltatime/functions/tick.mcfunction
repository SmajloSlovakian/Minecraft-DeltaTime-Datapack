execute store result score border deltatime run worldborder get

# defaults
# max: 59999968
# min: 59899968

# max worldborder
execute in minecraft:overworld run worldborder set 59999968

# min worldborder
execute in minecraft:overworld run worldborder set 59899968 5

# max worldborder
scoreboard players set a deltatime 59999968

# min worldborder
scoreboard players remove a deltatime 59899968
scoreboard players remove border deltatime 59899968

scoreboard players operation border deltatime /= accuracy deltatime
scoreboard players operation a deltatime /= border deltatime
scoreboard players operation buffer deltatime += a deltatime

scoreboard players operation a deltatime /= 5 deltatime
scoreboard players operation tickdelta deltatime = a deltatime

scoreboard players operation a deltatime = buffer deltatime
scoreboard players operation a deltatime /= accuracy deltatime
scoreboard players operation tickstoadd deltatime = a deltatime

scoreboard players operation a deltatime *= accuracy deltatime
scoreboard players operation buffer deltatime -= a deltatime

tellraw @a[tag=debugtick] ["tickdelta: ",{"score":{"name": "tickdelta","objective": "deltatime"}}," tickstoadd: ",{"score":{"name": "tickstoadd","objective": "deltatime"}}," buffer: ",{"score":{"name": "buffer","objective": "deltatime"}}]
