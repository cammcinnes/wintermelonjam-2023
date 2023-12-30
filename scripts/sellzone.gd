extends StaticBody2D
signal trytosell

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.has_method("player_sell_method"):
		#print("selling")
		#trytosell.emit()
		#if Input.is_action_pressed("interact"):
		var corn = Main.numofcorn
		var wheat = Main.numofwheat
		var money = Main.cash
		
		# sell corn
		money += corn * 2
		# sell wheat
		money += wheat * 10
		
		wheat = 0
		corn = 0
		
		Main.cash = money
		Main.numofcorn = corn
		Main.numofwheat = wheat
	
		

