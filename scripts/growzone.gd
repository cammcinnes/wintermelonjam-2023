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
	# stops plants growing in end screen
	if Main.gameover:
		$plant.play("none")
		plant_grown = false
		plantgrowing = false


func _on_area_2d_area_entered(area):
	if not plantgrowing:
		Main.first_time_plant = false
		if plant == 1 and Main.numofcornseed > 0:
			grow_corn()
			Main.numofcornseed -= 1
		if plant == 2 and Main.numofwheatseed > 0:
			grow_wheat()
			Main.numofwheatseed -= 1
	else: 
		pass
			

# change frames on timer timeout 5 sec intervals
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

# change frames on timer timeout 8sec intervals
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

# start corn timer and show growth
func grow_corn():
	plantgrowing = true
	$corn_grow_timer.start()
	$plant.play("corn_grow")
	Main.onCooldown = true
	
# start wheat timer and show growth
func grow_wheat():
	plantgrowing = true
	$wheat_grow_timer.start()
	$plant.play("wheat_grow")
	Main.onCooldown = true

# get rid of corn in grow zone and add money to player
func harvest_corn():
	Main.numofcorn += 1
	plantgrowing = false
	plant_grown = false
	$hoed_land/can_grow.occupied = false
	$plant.play("none")

# get rid of wheat in grow zone and add money to player
func harvest_wheat():
	Main.numofwheat += 1
	$hoed_land/can_grow.occupied = false
	plantgrowing = false
	plant_grown = false
	$plant.play("none")


func _on_can_grow_body_entered(body):
	if body.has_method("move_player"):
		Main.first_time_harvest = false
		if plant_grown:
			if plant == 1:
				harvest_corn()
			if plant == 2:
				harvest_wheat()
			else:
				pass
