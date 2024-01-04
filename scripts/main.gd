extends Node
#1 wheat, 2 corn
var plantselected = 1
var numofwheat = 0
var numofcorn = 0
var cash = 97

# variables for tips
var tutorial = true

var first_time_buy = true
var first_time_plant = true
var first_time_harvest = true
var first_time_sell = true
var first_time_objective = true
var first_time_win = true

# planting cooldown
var onCooldown = false

# global for weather
var weather

var start = false
var ingame = false
var gameover = false

func game_over():
	gameover = true
	ingame = false
