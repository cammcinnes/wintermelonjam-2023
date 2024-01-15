extends StaticBody2D

var selected = false;
var seed_type = 2 #wheat
var planted = false


func _ready():
	$AnimatedSprite2D.play("default")
	

func _physics_process(_delta):
	if selected:
		global_position = get_global_mouse_position()
	if Main.numofwheatseed <= 0:
		self.visible = false
		selected = false
	Main.wheat_selected = selected


# select wheat seed to plant
func _input(event):
	if Input.is_action_just_pressed("select_wheat"):
		if not selected and not Main.corn_selected:
			Main.plantselected = seed_type
			if not Main.first_time_buy:
				Main.first_time_select = false
			self.visible = true
			selected = true
		else:
			self.visible = false
			selected = false
	
# de select wheat seed if body is not occupied and grow zone
func _on_area_2d_entered(body):
	if body.has_method("can_grow") and not body.occupied:
			body.occupied = true
		
