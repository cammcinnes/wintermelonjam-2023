extends Node


func newGame():
	$player.start($start_position.position)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	newGame()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
