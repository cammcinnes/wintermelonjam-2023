extends CanvasLayer
# Called when the node enters the scene tree for the first time.

# only here so restart button Timer only appears once
var singleTimer = true
# run on load
func _ready():
	$crop.visible = false
	$money.visible = false
	
# run after game was started by pressing button
func start_in_game_gui():
	change_to_ingame_vis()
	add_text_to_ingame_gui()

func add_text_to_ingame_gui():
	$crop/wheat_label.text = ": 0"
	$crop/corn_label.text = ": 0"
	$money/cash_label.text = ": 0"
	$gameover/end_screen.text = ""

# allow to show parts of hud in the ingame
func change_to_ingame_vis():
	$start.visible = false
	$crop.visible = true
	$money.visible = true
	$gameover.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_gui_labels()
	updatecash()
	if Main.gameover and singleTimer:
		game_over_screen()
		# start timer for restart button if hasn't already been started
		if singleTimer:
			$gameover/Timer.start()
			singleTimer = false

func update_gui_labels():
	$crop/wheat_label.text = ": " + str(Main.numofwheat)
	$crop/corn_label.text = ": " + str(Main.numofcorn)
	$money/cash_label.text = ": " + str(Main.cash)

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

# Makes the game over screen visible
func game_over_screen():
	$gameover.visible = true
	$gameover/end_screen.visible = true
	$gameover/restart_button.visible = false
	$gameover/end_screen.text = "You may finally rest..."
