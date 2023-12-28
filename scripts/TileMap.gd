extends TileMap
# Called when the node enters the scene tree for the first time.
var v = Vector2(320, 180)
func _ready():
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	disappear(v)
	
func disappear(vector2):
	$TileMap.set_shader_param("fade_speed", 0.1)
	$TileMap.set_shader_param("exclude_tile_coordinates", vector2)
