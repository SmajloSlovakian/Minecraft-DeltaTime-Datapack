execute in deltatime:calculation run worldborder center 0 0
#execute in deltatime:calculation run worldborder set 59999968
execute in deltatime:calculation run worldborder set 59990000

scoreboard objectives add deltatime dummy
scoreboard players set tickstoadd deltatime 0
scoreboard players set tickdelta deltatime 0
scoreboard players set buffer deltatime 0

execute unless score accuracy deltatime matches 0.. run scoreboard players set accuracy deltatime 1000000
