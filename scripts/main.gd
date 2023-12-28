extends Node

var shader_material: ShaderMaterial
var v = Vector2(0, 0)

func newGame():
	$player.start($start_position.position)
	disappear(v)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	newGame()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func disappear(vector2):
	$TileMap.material.set_shader_parameter("fade_speed", 0.1)
	$TileMap.material.set_shader_parameter("exclude_tile_coordinates", vector2)
