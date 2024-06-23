execute in deltatime:calculation run execute store result score b deltatime run worldborder get
tellraw @a[tag=debugtick1] "\n\n------------------------------------------"
tellraw @a[tag=debugtick1] ["border: ",{"score":{"name": "b","objective": "deltatime"}}]
# defaults
# max: 59999968
# min: 1

# max worldborder
execute in deltatime:calculation run worldborder set 59999968

# min worldborder
execute in deltatime:calculation run worldborder set 1 10

# max worldborder
scoreboard players set a deltatime 59999968

# min worldborder
scoreboard players remove a deltatime 1
scoreboard players remove b deltatime 1

# expected results:
#  - a = 59999999 m (max)
#  - b = 5999999 m (current)
#  - max = 10 s (max seconds)
#  - acc = 1000 (accuracy)
#  - buf = 0 ()

## b // (a // acc) = c
#  - a //= acc
#  - b //= a
# c = b

## acc * max - c * max = d
#  - a = max
#  - b *= a
#  - a *= acc
#  - a -= b
# d = a

## d + buffer = e
#  - a += buf
#  - buf = a
# e = a
# e = buf
##OUTPUT: tickdelta = a

## e * 20 // acc = f
#  - b = 20
#  - a *= b
#  - a //= acc
# f = a
# e = buf
# 20 = b
##OUTPUT: tickstoadd = a

## buffer = e - f * acc // 20
#  - a *= acc
#  - a //= b
#  - buf -= a
##OUTPUT: buffer = buffer


#  - 5999999 m // (59999999 m // 1000) = 100 ‰
#  - 1000 * 50 s - 50 s * 100 ‰ = 90 000 ms
#  - 90 000 ms + buffer(0 ms) = 90 000 ms
#  - 90 000 ms * 20 // 1000 = 1800 t
#  - buffer = 90 000 ms - 1800 t // 20 * 1000


## TESTING LINES! TODO REMOVE

#scoreboard players set a deltatime 59999999
#scoreboard players set b deltatime 5999999
tellraw @a[tag=debugtick1] ["1: a: ",{"score":{"name": "a","objective": "deltatime"}}," b: ",{"score":{"name": "b","objective": "deltatime"}}]



scoreboard players operation a deltatime /= accuracy deltatime
tellraw @a[tag=debugtick1] ["2: a: ",{"score":{"name": "a","objective": "deltatime"}}," b: ",{"score":{"name": "b","objective": "deltatime"}}]
scoreboard players operation b deltatime /= a deltatime
tellraw @a[tag=debugtick1] ["3: a: ",{"score":{"name": "a","objective": "deltatime"}}," b: ",{"score":{"name": "b","objective": "deltatime"}}]


scoreboard players set a deltatime 10
tellraw @a[tag=debugtick1] ["4: a: ",{"score":{"name": "a","objective": "deltatime"}}," b: ",{"score":{"name": "b","objective": "deltatime"}}]
scoreboard players operation b deltatime *= a deltatime
tellraw @a[tag=debugtick1] ["5: a: ",{"score":{"name": "a","objective": "deltatime"}}," b: ",{"score":{"name": "b","objective": "deltatime"}}]
scoreboard players operation a deltatime *= accuracy deltatime
tellraw @a[tag=debugtick1] ["6: a: ",{"score":{"name": "a","objective": "deltatime"}}," b: ",{"score":{"name": "b","objective": "deltatime"}}]
scoreboard players operation a deltatime -= b deltatime
tellraw @a[tag=debugtick1] ["7: a: ",{"score":{"name": "a","objective": "deltatime"}}," b: ",{"score":{"name": "b","objective": "deltatime"}}]


scoreboard players operation a deltatime += buffer deltatime
tellraw @a[tag=debugtick1] ["8: a: ",{"score":{"name": "a","objective": "deltatime"}}," b: ",{"score":{"name": "b","objective": "deltatime"}}]
scoreboard players operation buffer deltatime = a deltatime
tellraw @a[tag=debugtick1] ["9: a: ",{"score":{"name": "a","objective": "deltatime"}}," b: ",{"score":{"name": "b","objective": "deltatime"}}]


scoreboard players operation tickdelta deltatime = a deltatime
tellraw @a[tag=debugtick1] ["A: a: ",{"score":{"name": "a","objective": "deltatime"}}," b: ",{"score":{"name": "b","objective": "deltatime"}}]

scoreboard players set b deltatime 20
tellraw @a[tag=debugtick1] ["B: a: ",{"score":{"name": "a","objective": "deltatime"}}," b: ",{"score":{"name": "b","objective": "deltatime"}}]
scoreboard players operation a deltatime *= b deltatime
tellraw @a[tag=debugtick1] ["C: a: ",{"score":{"name": "a","objective": "deltatime"}}," b: ",{"score":{"name": "b","objective": "deltatime"}}]
scoreboard players operation a deltatime /= accuracy deltatime
tellraw @a[tag=debugtick1] ["D: a: ",{"score":{"name": "a","objective": "deltatime"}}," b: ",{"score":{"name": "b","objective": "deltatime"}}]



scoreboard players operation tickstoadd deltatime = a deltatime
tellraw @a[tag=debugtick1] ["E: a: ",{"score":{"name": "a","objective": "deltatime"}}," b: ",{"score":{"name": "b","objective": "deltatime"}}]

scoreboard players operation a deltatime *= accuracy deltatime
tellraw @a[tag=debugtick1] ["F: a: ",{"score":{"name": "a","objective": "deltatime"}}," b: ",{"score":{"name": "b","objective": "deltatime"}}]
scoreboard players operation a deltatime /= b deltatime
tellraw @a[tag=debugtick1] ["G: a: ",{"score":{"name": "a","objective": "deltatime"}}," b: ",{"score":{"name": "b","objective": "deltatime"}}]
scoreboard players operation buffer deltatime -= a deltatime
tellraw @a[tag=debugtick1] ["H: a: ",{"score":{"name": "a","objective": "deltatime"}}," b: ",{"score":{"name": "b","objective": "deltatime"}}]



tellraw @a[tag=debugtick] ["tickdelta: ",{"score":{"name": "tickdelta","objective": "deltatime"}}," tickstoadd: ",{"score":{"name": "tickstoadd","objective": "deltatime"}}," buffer: ",{"score":{"name": "buffer","objective": "deltatime"}}]
