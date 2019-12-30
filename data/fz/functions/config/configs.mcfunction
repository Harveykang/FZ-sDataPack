scoreboard players reset @s options
function fz:noai/configs
execute if score carpet carpet matches 1.. run tellraw @s {"text":"--不计入计分板总分的假人--","color":"dark_green","bold":true}
execute if score carpet carpet matches 1.. run tellraw @s [{"text":"- 生成假人："},{"text":"/script invoke summon 玩家名","color":"green","clickEvent":{"action":"suggest_command","value":"/script invoke summon "},"hoverEvent":{"action":"show_text","value":"点击以写入聊天栏"}}]
execute if score carpet carpet matches 1.. run tellraw @s [{"text":"- 删除假人："},{"text":"/script invoke kill 玩家名","color":"green","clickEvent":{"action":"suggest_command","value":"/script invoke kill "},"hoverEvent":{"action":"show_text","value":"点击以写入聊天栏"}}]
tellraw @s [{"text":"--扫地姬--","color":"dark_green","bold":true}]
tellraw @s [{"text":"- 指令："},{"text":"/trigger cleaner set -1为关;秒数(≥30)为开","color":"green","clickEvent":{"action":"suggest_command","value":"/trigger cleaner set "},"hoverEvent":{"action":"show_text","value":"点击以写入聊天栏"}}]
tellraw @s [{"text":"- 预设："},{"text":"[OFF]","color":"dark_red","clickEvent":{"action":"run_command","value":"/trigger cleaner set -1"}},{"text":"[30s]","color":"red","clickEvent":{"action":"run_command","value":"/trigger cleaner set 30"}},{"text":"[1min]","color":"gold","clickEvent":{"action":"run_command","value":"/trigger cleaner set 60"}},{"text":"[2min]","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger cleaner set 120"}},{"text":"[3min]","color":"green","clickEvent":{"action":"run_command","value":"/trigger cleaner set 180"}},{"text":"[5min]","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger cleaner set 300"}}]
tellraw @s {"text":"--记分板--","color":"dark_green","bold":true}
tellraw @s [{"text":"- 指令："},{"text":"/trigger scoreSwitch set -1为关/1-9为开","color":"green","clickEvent":{"action":"suggest_command","value":"/trigger scoreSwitch set "},"hoverEvent":{"action":"show_text","value":"点击以写入聊天栏"}}]
tellraw @s [{"text":"[OFF]","color":"dark_red","clickEvent":{"action":"run_command","value":"/trigger scoreSwitch set -1"}},{"text":"[轮播]","color":"dark_green","clickEvent":{"action":"run_command","value":"/trigger scoreSwitch set 1"}},{"text":"[击杀榜]","color":"red","clickEvent":{"action":"run_command","value":"/trigger scoreSwitch set 2"}},{"text":"[挖掘榜]","color":"gray","clickEvent":{"action":"run_command","value":"/trigger scoreSwitch set 3"}},{"text":"[死亡榜]","color":"dark_red","clickEvent":{"action":"run_command","value":"/trigger scoreSwitch set 4"}},{"text":"[交易榜]","color":"green","clickEvent":{"action":"run_command","value":"/trigger scoreSwitch set 5"}},{"text":"[钓鱼榜]","color":"blue","clickEvent":{"action":"run_command","value":"/trigger scoreSwitch set 6"}},{"text":"[奥里给！]","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger scoreSwitch set 7"}},{"text":"[活跃度]","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger scoreSwitch set 8"}},{"text":"[统计总量]","color":"light_purple","clickEvent":{"action":"run_command","value":"/trigger scoreSwitch set 9"}}]