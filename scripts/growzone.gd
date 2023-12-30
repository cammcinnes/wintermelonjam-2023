extends StaticBody2D

var plant = Main.plantselected
var plantgrowing = false
var plant_grown = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$plant.play("none")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# prevents picking wrong plant
	if plantgrowing == false:
		plant = Main.plantselected


func _on_area_2d_area_entered(area):
	if not plantgrowing:
		if plant == 1:
			plantgrowing = true
			$corn_grow_timer.start()
			$plant.play("corn_grow")
		if plant == 2:
			plantgrowing = true
			$wheat_grow_timer.start()
			$plant.play("wheat_grow")
	else: 
		print("Space is already occupied")


func _on_corn_grow_timer_timeout():
	var corn_plant = $plant
	if corn_plant.frame == 0:
		corn_plant.frame = 1
		$corn_grow_timer.start()
	elif corn_plant.frame == 1:
		corn_plant.frame = 2
		$corn_grow_timer.start()
	elif corn_plant.frame == 2:
		corn_plant.frame = 3
		plant_grown = true


func _on_wheat_grow_timer_timeout():
	var wheat_plant = $plant
	if wheat_plant.frame == 0:
		wheat_plant.frame = 1
		$wheat_grow_timer.start()
	elif wheat_plant.frame == 1:
		wheat_plant.frame = 2
		$wheat_grow_timer.start()
	elif wheat_plant.frame == 2:
		wheat_plant.frame = 3
		plant_grown = true


func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		if plant_grown:
			if plant == 1:
				Main.numofcorn += 1
				plantgrowing = false
				plant_grown = false
				$plant.play("none")
			if plant == 2:
				Main.numofwheat += 1
				plantgrowing = false
				plant_grown = false
				$plant.play("none")
			else:
				pass
