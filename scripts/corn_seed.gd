extends StaticBody2D
var selected = false
var seed_type = 1 #corn
var planted = false


func _ready():
	$AnimatedSprite2D.play("default")
	

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)


# select with mouse cursor
func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		Main.plantselected = seed_type
		selected = true

# select with a left click
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and not event.pressed:
			selected = false
		

# add plant to grow zone if not occupied
func _on_area_2d_body_entered(body):
	if body.has_method("can_grow") and not body.occupied:
		selected = false
		planted = true
		body.occupied = true
