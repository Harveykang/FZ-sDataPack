execute as @a unless score @s leaveGame matches -2147483648..2147483647 run scoreboard players operation @s leaveGame = @s leaveGame
tellraw @a[scores={leaveGame=0..}] [{"text":"使用","color":"gold"},{"text":"/trigger options","underlined":true,"clickEvent":{"action":"run_command","value":"/trigger options"},"hoverEvent":{"action":"show_text","value":"点击以访问全部设置"}},{"text":"以访问帮助和全部设置"}]
scoreboard players set @a[scores={leaveGame=0..}] leaveGame -1