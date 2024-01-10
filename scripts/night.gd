extends StaticBody2D

# has started the game
var started = false

var state = "day"

var change_state = false

var length_of_day = 120
var length_of_night = 60

func _ready():
	if state == "day":
		$ColorRect.color.a = 0
	elif state == "night":
		$ColorRect.color.a = 0

func _on_timer_timeout():
	if state == "day":
		state = "night"
	elif state == "night":
		state = "day"
		
	change_state = true

func _process(delta):
	if Main.ingame:
		self.visible = true
		if not started:
			$Timer.wait_time = length_of_day
			$Timer.start()
			started = true
		if change_state:
			# our new state is day or night; state we want to change to
			if state == "day":
				change_to_day()
			if state == "night":
				change_to_night()
			change_state = false
	else:
		self.visible = false
	
	if Main.gameover:
		started = false

func change_to_day():
	$AnimationPlayer.play("night_to_day")
	$Timer.wait_time = length_of_day
	$Timer.start()
	
func change_to_night():
	$AnimationPlayer.play("day_to_night")
	$Timer.wait_time = length_of_night
	$Timer.start()
