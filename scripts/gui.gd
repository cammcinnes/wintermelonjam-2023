extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/wheat_label.text = ": 0"
	$Control/corn_label.text = ": 0"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Control/wheat_label.text = ": " + str(Main.numofwheat)
	$Control/corn_label.text = ": " + str(Main.numofcorn)
	
