execute in minecraft:overworld run worldborder center 0 0
execute in minecraft:overworld run worldborder set 59999968

scoreboard objectives add deltatime dummy
scoreboard players set tickstoadd deltatime 0
scoreboard players set tickdelta deltatime 0
scoreboard players set buffer deltatime 0
scoreboard players set 5 deltatime 5

execute if score accuracy deltatime matches 0.. run scoreboard players set accuracy deltatime 100
