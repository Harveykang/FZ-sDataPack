#活跃度模块#
function fz:score/activation/main
####
#记分板循环#
scoreboard players add scoreboard timeCounter 1
execute if score scoreboard timeCounter matches 600 run scoreboard objectives setdisplay sidebar.team.gold killCounter
execute if score scoreboard timeCounter matches 1200 run scoreboard objectives setdisplay sidebar.team.gold digCounter
execute if score scoreboard timeCounter matches 1800 run scoreboard objectives setdisplay sidebar.team.gold deathCounter
execute if score scoreboard timeCounter matches 2400 run scoreboard objectives setdisplay sidebar.team.gold tradingCounter
execute if score scoreboard timeCounter matches 3000 run scoreboard objectives setdisplay sidebar.team.gold fishingCounter
execute if score scoreboard timeCounter matches 3600 run scoreboard objectives setdisplay sidebar.team.gold damageTaken
execute if score scoreboard timeCounter matches 4200 run scoreboard objectives setdisplay sidebar.team.gold activation
execute if score scoreboard timeCounter matches 4800 run scoreboard objectives setdisplay sidebar.team.gold totalList
execute if score scoreboard timeCounter matches 4800.. run scoreboard players set scoreboard timeCounter 0
####
#记分板开关#
scoreboard players enable @a scoreSwitch
execute as @a if entity @a[scores={scoreSwitch=..-1},team=!displayScoresOff] run function fz:score/teams/displayscoresoff
execute if entity @a[scores={scoreSwitch=1},team=!displayScoresOn] run function fz:score/teams/displayscoreson
execute if entity @a[scores={scoreSwitch=2},team=!killCounter] run function fz:score/teams/killcounter
execute if entity @a[scores={scoreSwitch=3},team=!digCounter] run function fz:score/teams/digcounter
execute if entity @a[scores={scoreSwitch=4},team=!deathCounter] run function fz:score/teams/deathcounter
execute if entity @a[scores={scoreSwitch=5},team=!tradingCounter] run function fz:score/teams/tradingcounter
execute if entity @a[scores={scoreSwitch=6},team=!fishingCounter] run function fz:score/teams/fishingcounter
execute if entity @a[scores={scoreSwitch=7},team=!damageTaken] run function fz:score/teams/damagetaken
execute if entity @a[scores={scoreSwitch=8},team=!activation] run function fz:score/activation/team
execute if entity @a[scores={scoreSwitch=9},team=!totalList] run function fz:score/teams/totallist
execute if entity @a[scores={scoreSwitch=10..}] run tellraw @a[scores={scoreSwitch=10..}] [{"text":"不存在编号为10及以上的记分板","color":"dark_red"}]
scoreboard players set @a[scores={scoreSwitch=..-1}] scoreSwitch 0
scoreboard players set @a[scores={scoreSwitch=1..}] scoreSwitch 0
team join displayScoresOff @a[team=]
####
#添加工具计入挖掘量#
execute if entity @a[scores={diamond_pickaxe=1..}] as @a[scores={diamond_pickaxe=1..}] run function fz:score/tools/diamond_pickaxe
execute if entity @a[scores={iron_pickaxe=1..}] as @a[scores={iron_pickaxe=1..}] run function fz:score/tools/iron_pickaxe
execute if entity @a[scores={stone_pickaxe=1..}] as @a[scores={stone_pickaxe=1..}] run function fz:score/tools/stone_pickaxe
execute if entity @a[scores={diamond_axe=1..}] as @a[scores={diamond_axe=1..}] run function fz:score/tools/diamond_axe
execute if entity @a[scores={iron_axe=1..}] as @a[scores={iron_axe=1..}] run function fz:score/tools/iron_axe
execute if entity @a[scores={stone_axe=1..}] as @a[scores={stone_axe=1..}] run function fz:score/tools/stone_axe
execute if entity @a[scores={diamond_shovel=1..}] as @a[scores={diamond_shovel=1..}] run function fz:score/tools/diamond_shovel
execute if entity @a[scores={iron_shovel=1..}] as @a[scores={iron_shovel=1..}] run function fz:score/tools/iron_shovel
execute if entity @a[scores={stone_shovel=1..}] as @a[scores={stone_shovel=1..}] run function fz:score/tools/stone_shovel
####
#计算总量#
#给缓存记分板赋初始值
execute as @a unless score @s tDigC matches -2147483648..2147483647 run scoreboard players operation @s tDigC = @s tDigC
execute as @a unless score @s tKillC matches -2147483648..2147483647 run scoreboard players operation @s tKillC = @s tKillC
execute as @a unless score @s tDeathC matches -2147483648..2147483647 run scoreboard players operation @s tDeathC = @s tDeathC
execute as @a unless score @s tTradeC matches -2147483648..2147483647 run scoreboard players operation @s tTradeC = @s tTradeC
execute as @a unless score @s tFishC matches -2147483648..2147483647 run scoreboard players operation @s tFishC = @s tFishC
execute as @a unless score @s tHurtC matches -2147483648..2147483647 run scoreboard players operation @s tHurtC = @s tHurtC
execute as @a unless score @s tActC matches -2147483648..2147483647 run scoreboard players operation @s tActC = @s tActC
#两板分数不等时运行计算函数
execute as @a[tag=!carpetBot] unless score @s tDigC = @s digCounter run function fz:score/totalcalculator/tdigc
execute as @a[tag=!carpetBot] unless score @s tKillC = @s killCounter run function fz:score/totalcalculator/tkillc
execute as @a[tag=!carpetBot] unless score @s tDeathC = @s deathCounter run function fz:score/totalcalculator/tdeathc
execute as @a[tag=!carpetBot] unless score @s tTradeC = @s tradingCounter run function fz:score/totalcalculator/ttradec
execute as @a[tag=!carpetBot] unless score @s tFishC = @s fishingCounter run function fz:score/totalcalculator/tfishc
execute as @a[tag=!carpetBot] unless score @s tHurtC = @s damageTaken run function fz:score/totalcalculator/thurtc
execute as @a[tag=!carpetBot] unless score @s tActC = @s activation run function fz:score/activation/totalcalculator
#总榜在分榜中显示开sc=1
execute if score totalDug totalDug matches 1.. run scoreboard players operation totalDug digCounter = totalDug totalList
execute if score totalKilled totalKilled matches 1.. run scoreboard players operation totalKilled killCounter = totalKilled totalList
execute if score totalDeath totalDeath matches 1.. run scoreboard players operation totalDeath deathCounter = totalDeath totalList
execute if score totalTraded totalTraded matches 1.. run scoreboard players operation totalTraded tradingCounter = totalTraded totalList
execute if score totalFished totalFished matches 1.. run scoreboard players operation totalFished fishingCounter = totalFished totalList
execute if score totalHurt totalHurt matches 1.. run scoreboard players operation totalHurt damageTaken = totalHurt totalList
execute if score totalActivation totalActivation matches 1.. run scoreboard players operation totalActivation activation = totalActivation totalList
#总榜在分榜中显示关sc=0
#execute if score totalDug totalDug matches ..0 run function fz:score/totalnodisplay/digcounter
#execute if score totalKilled totalKilled matches ..0 run function fz:score/totalnodisplay/killcounter
#execute if score totalDeath totalDeath matches ..0 run function fz:score/totalnodisplay/deathcounter
#execute if score totalTraded totalTraded matches ..0 run function fz:score/totalnodisplay/tradingcounter
#execute if score totalFished totalFished matches ..0 run function fz:score/totalnodisplay/fishingcounter
#execute if score totalHurt totalHurt matches ..0 run function fz:score/totalnodisplay/damagetaken
#execute if score totalActivation totalActivation matches ..0 run function fz:score/activation/totalnodisplay
####