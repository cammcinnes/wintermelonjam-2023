extends CanvasLayer
# Called when the node enters the scene tree for the first time.
signal startsignal

# run on load
func _ready():
	$crop.visible = false
	$money.visible = false
	$gameover.visible = false
	
# run after game was started by pressing button
func start():
	$start.visible = false
	$crop.visible = true
	$money.visible = true
	$gameover.visible = false
	$crop/wheat_label.text = ": 0"
	$crop/corn_label.text = ": 0"
	$money/cash_label.text = ": 0"
	$gameover/end_screen.text = "You may finally rest..."
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$crop/wheat_label.text = ": " + str(Main.numofwheat)
	$crop/corn_label.text = ": " + str(Main.numofcorn)
	$money/cash_label.text = ": " + str(Main.cash)
	updatecash()
	if Main.gameover:
		$gameover.visible = true
		$gameover/restart_button.visible = false
		$gameover/Timer.start()
		set_process(false)

func updatecash():
	var icon = $money/cash
	if (Main.cash < 10):
		icon.frame = 0
	elif (Main.cash > 10 && Main.cash < 100):
		icon.frame = 1
	elif (Main.cash > 100):
		icon.frame = 2

func _on_start_button_pressed():
	start()
	Main.start = true


func _on_end_timer_timeout():
	$gameover/restart_button.visible = true

