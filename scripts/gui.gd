extends CanvasLayer
# Called when the node enters the scene tree for the first time.

# only here so restart button Timer only appears once
var singleTimer = true
# run on load
func _ready():
	$crop.visible = false
	$money.visible = false
	$gameover.visible = false
	
# run after game was started by pressing button
func start_in_game_gui():
	$start.visible = false
	$crop.visible = true
	$money.visible = true
	$gameover.visible = false
	$gameover/end_screen.visible = false
	$crop/wheat_label.text = ": 0"
	$crop/corn_label.text = ": 0"
	$money/cash_label.text = ": 0"
	$gameover/end_screen.text = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$crop/wheat_label.text = ": " + str(Main.numofwheat)
	$crop/corn_label.text = ": " + str(Main.numofcorn)
	$money/cash_label.text = ": " + str(Main.cash)
	updatecash()
	if Main.gameover and singleTimer:
		$gameover.visible = true
		$gameover/end_screen.visible = true
		$gameover/restart_button.visible = false
		$gameover/end_screen.text = "You may finally rest..."
		if singleTimer:
			$gameover/Timer.start()
			singleTimer = false

func updatecash():
	var icon = $money/cash
	if (Main.cash < 10):
		icon.frame = 0
	elif (Main.cash > 10 && Main.cash < 100):
		icon.frame = 1
	elif (Main.cash > 100):
		icon.frame = 2

func _on_start_button_pressed():
	Main.start = true
	Main.gameover = false
	singleTimer = true
	intializeItem()
	start_in_game_gui()


func _on_end_timer_timeout():
	$gameover/restart_button.visible = true

func intializeItem():
	Main.plantselected = 1
	Main.numofwheat = 0
	Main.numofcorn = 0
	Main.cash = 100

