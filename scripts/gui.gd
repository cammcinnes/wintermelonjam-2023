extends CanvasLayer
# Called when the node enters the scene tree for the first time.

# only here so restart button Timer only appears once
var singleTimer = true
var singleObjectiveTimer = true
# run on load
func _ready():
	$crop.visible = false
	$money.visible = false
	$tips.visible = false
	if Main.tutorial:
		$start/tips_color/Label.text = "tutorial: on"
	else:
		$start/tips_color/Label.text = "tutorial: off"
	
# run after game was started by pressing button
func start_in_game_gui():
	change_to_ingame_vis()
	add_text_to_ingame_gui()

func add_text_to_ingame_gui():
	$crop/wheat_label.text = ": 0"
	$crop/corn_label.text = ": 0"
	$money/wheat_seed_label.text = ": 0"
	$money/corn_seed_label.text = ": 0"
	$money/cash_label.text = ": 0"
	$gameover/end_screen.text = ""

# allow to show parts of hud in the ingame
func change_to_ingame_vis():
	$start.visible = false
	$crop.visible = true
	$money.visible = true
	$gameover.visible = false
	$tips.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_gui_labels()
	updatecash()
	showBuyTip()
	showSelectTip()
	showPlantTip()
	showHarvestTip()
	showSellTip()
	showObjectiveTip()
	showWinTip()
	if Main.gameover and singleTimer:
		game_over_screen()
		# start timer for restart button if hasn't already been started
		if singleTimer:
			$gameover/Timer.start()
			singleTimer = false

func update_gui_labels():
	$crop/wheat_label.text = ": " + str(Main.numofwheat)
	$crop/corn_label.text = ": " + str(Main.numofcorn)
	$money/wheat_seed_label.text = ": " + str(Main.numofwheatseed)
	$money/corn_seed_label.text = ": " + str(Main.numofcornseed)
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
	Main.cash = 1

# Makes the game over screen visible
func game_over_screen():
	$gameover.visible = true
	$tips.visible = false
	$gameover/end_screen.visible = true
	$gameover/restart_button.visible = false
	$gameover/end_screen.text = "You may finally rest..."

# show objective until timer runs out on first playthrough
func showObjectiveTip():
	if not Main.first_time_sell and Main.first_time_objective:
		$tips/objective.visible = true
		if Main.cash < 100:
			$tips/objective.text = "We only need $" + str(100 - Main.cash) + " until we can retire"
		else:
			$tips/objective.text = "Stop cheating!"
		if singleObjectiveTimer:
			$tips/Timer.start()
			singleObjectiveTimer = false 
	else:
		$tips/objective.visible = false

func _on_objective_timer_timeout():
	Main.first_time_objective = false

func showSellTip():
	if not Main.first_time_harvest and Main.first_time_sell:
		$tips/sell_seeds.visible = true
		$tips/sell_seeds.text = "We can sell our crops by walking in front of the shopkeeper"
	else:
		$tips/sell_seeds.visible = false

func showHarvestTip():
	if not Main.first_time_plant and Main.first_time_harvest:
		$tips/harvest_seeds.visible = true
		$tips/harvest_seeds.text = "After our crops are fully grown we can walk over them to harvest"
	else:
		$tips/harvest_seeds.visible = false
		
func showSelectTip():
	if not Main.first_time_buy and Main.first_time_select:
		$tips/select_seeds.visible = true
		$tips/select_seeds.text = "Press 1 to select purchased corn seeds, Press 2 to select purchased wheat seeds"
	else:
		$tips/select_seeds.visible = false

func showPlantTip():
	if not Main.first_time_select and Main.first_time_plant:
		$tips/plant_seeds.visible = true
		$tips/plant_seeds.text = "Hover your cursor with a seed type selected over an open fertilized plot of land to plant them"
	else:
		$tips/plant_seeds.visible = false

func showBuyTip():
	if Main.first_time_buy and Main.ingame:
		$tips/buy_seeds.visible = true
		$tips/buy_seeds.text = "I should purchase some seeds from the shopkeeper"
	else:
		$tips/buy_seeds.visible = false

func showWinTip():
	if not Main.first_time_objective and Main.cash >= 100:
		$tips/win.visible = true
		$tips/win.text = "We can now buy our retirement from the shopkeeper"
	else:
		$tips/win.visible = false


func _on_tips_button_pressed():
	if Main.tutorial:
		Main.tutorial = false
		$start/tips_color/Label.text = "tutorial: off"
	else:
		Main.tutorial = true
		$start/tips_color/Label.text = "tutorial: on"
	updateTutorial()

func updateTutorial():
	if Main.tutorial:
		Main.first_time_buy = true
		Main.first_time_plant = true
		Main.first_time_harvest = true
		Main.first_time_sell = true
		Main.first_time_objective = true
		Main.first_time_win = true
		Main.first_time_select = true
	else:	
		Main.first_time_buy = false
		Main.first_time_plant = false
		Main.first_time_harvest = false
		Main.first_time_sell = false
		Main.first_time_objective = false
		Main.first_time_win = false
		Main.first_time_select = false
