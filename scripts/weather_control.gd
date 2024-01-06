extends StaticBody2D

# weather: none or rain
var curr_weather = "none"
# game started
var started
# intialize the timer
var initialize = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if curr_weather == "none":
		self.visible = false
	elif curr_weather == "rain":
		self.visible = true
		$rain_sound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Main.weather = curr_weather
	if Main.ingame and not initialize:
		$Timer.start()
		initialize = true
	if curr_weather == "none":
		self.visible = false
	elif curr_weather == "rain":
		self.visible = true
	if curr_weather == "rain" and Main.curr_scene == "house":
		$rain_sound.set_volume_db(-20)
	else:
		$rain_sound.set_volume_db(-15)
		

#switch weather on timer if not in game_over screen
func _on_timer_timeout():
	if not Main.gameover:
		if curr_weather == "none":
			curr_weather = "rain"
			$rain_sound.play()
			$Timer.wait_time = randf_range(10,60)
			$Timer.start()
		elif curr_weather == "rain":
			curr_weather = "none"
			$rain_sound.stop()
			$Timer.wait_time = randf_range(20,120)
			$Timer.start()
	else:
		curr_weather = "none"
		$rain_sound.stop()
