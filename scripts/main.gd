extends Node
#1 wheat, 2 corn
var plantselected = 1
var numofwheat = 0
var numofcorn = 0
var cash = 100

var onCooldown = false

var weather

var start = false
var ingame = false
var gameover = false

func game_over():
	gameover = true
	ingame = false
