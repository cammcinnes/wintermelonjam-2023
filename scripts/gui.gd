extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$crop/wheat_label.text = ": 0"
	$crop/corn_label.text = ": 0"
	$money/cash_label.text = ": 0"
	$Control/tips.text = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$crop/wheat_label.text = ": " + str(Main.numofwheat)
	$crop/corn_label.text = ": " + str(Main.numofcorn)
	$money/cash_label.text = ": " + str(Main.cash)
	updatecash()
	if Main.gameover:
		$Control/tips.text = "You may finally rest..."

func updatecash():
	var icon = $money/cash
	if (Main.cash < 10):
		icon.frame = 0
	elif (Main.cash > 10 && Main.cash < 100):
		icon.frame = 1
	elif (Main.cash > 100):
		icon.frame = 2

# display tip in hud
func tip():
	var hud = $Control/tips
	hud.text = "Press [Enter] to Sell Items"

