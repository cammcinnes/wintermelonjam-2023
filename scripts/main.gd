extends Node
#1 wheat, 2 corn
var plantselected = 1
var numofwheat = 0
var numofcorn = 0
var cash = 1;

var gameover = false
var music
var end_game 


# Called when the node enters the scene tree for the first time.
func _ready():
	music = $music
	end_game = $end_game
	if music:
		music.play()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func game_over():
	gameover = true
	var music2 = $music
	if music2:
		music2.stop()
		end_game.play()
	
