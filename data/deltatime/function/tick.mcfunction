execute in deltatime:calculation run execute store result score b deltatime run worldborder get
tellraw @a[tag=debugtick1] "\n\n------------------------------------------"
tellraw @a[tag=debugtick1] ["border: ",{"score":{"name": "b","objective": "deltatime"}}]
# defaults
# max: 59000001
# min: 1

# max worldborder
execute in deltatime:calculation run worldborder set 59000001
scoreboard players set a deltatime 59000001

# min worldborder
execute in deltatime:calculation run worldborder set 1 10
scoreboard players remove a deltatime 1
scoreboard players remove b deltatime 1


# expected results:
#  - a = 59990000 m (max)
#  - b = 123456 m (current)
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
##OUTPUT: tickdelta = a

## d + buffer = e
#  - a += buf
#  - buf = a
# e = a
# e = buf

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


#  - 123456 m / (59990000 m / 1000) = 2,0579
#  - 1000 * 10 s - 10 s * 2,0579 = 9 979,421
#  - 9 979,421 + buffer(0) = 9 979,421
#  - 9 979,421 * 20 / 1000 = 199,58842
#  - buffer = 9 979,421 - 199,58842 / 20 * 1000


#  - 123456 m // (59990000 m // 1000) = 2
#  - 1000 * 10 s - 10 s * 2 = 9 980
#  - 9 980 + buffer(0) = 9 980
#  - 9 980 * 20 // 1000 = 199
#  - buffer = 9 980 - 199 // 20 * 1000


#testing lines:
#scoreboard players set a deltatime 59990000
#scoreboard players set b deltatime 123456
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

scoreboard players operation tickdelta deltatime = a deltatime
tellraw @a[tag=debugtick1] ["8: a: ",{"score":{"name": "a","objective": "deltatime"}}," b: ",{"score":{"name": "b","objective": "deltatime"}}]

scoreboard players operation a deltatime += buffer deltatime
tellraw @a[tag=debugtick1] ["9: a: ",{"score":{"name": "a","objective": "deltatime"}}," b: ",{"score":{"name": "b","objective": "deltatime"}}]
scoreboard players operation buffer deltatime = a deltatime
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
