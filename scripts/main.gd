extends Node
#1 wheat, 2 corn
var plantselected = 1
var numofwheat = 0
var numofcorn = 0
var cash = 1;

var gameover = false


# Called when the node enters the scene tree for the first time.
func _ready():
	newGame()
	
func newGame():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func game_over():
	gameover = true
	
