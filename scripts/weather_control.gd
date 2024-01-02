extends StaticBody2D

# weather: none or rain
var curr_weather = "rain"
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
	if curr_weather == "none":
		self.visible = false
	elif curr_weather == "rain":
		self.visible = true


func _on_timer_timeout():
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
