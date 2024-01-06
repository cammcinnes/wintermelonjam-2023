extends StaticBody2D
var selected = false
var seed_type = 1 #corn
var planted = false


func _ready():
	$AnimatedSprite2D.play("default")
	

func _physics_process(delta):
	if selected:
		global_position = get_global_mouse_position()
	if Main.numofcornseed <= 0:
		self.visible = false
		selected = false

# select corn seed to plant
func _input(event):
	if Input.is_action_just_pressed("select_corn"):
		if not selected:
			if not Main.first_time_buy:
				Main.first_time_select = false
			Main.plantselected = seed_type
			self.visible = true
			selected = true
		else:
			self.visible = false
			selected = false

# add plant to grow zone if not occupied
func _on_area_2d_body_entered(body):
	if body.has_method("can_grow") and not body.occupied:
		body.occupied = true
