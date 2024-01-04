extends StaticBody2D
signal trytosell

func _on_area_2d_body_entered(body):
	if body.has_method("player_sell_method"):
		var corn = Main.numofcorn
		var wheat = Main.numofwheat
		var money = Main.cash
		
		if Main.numofcorn > 0 or Main.numofwheat > 0:
			Main.first_time_sell = false
			
		# sell corn
		money += corn * 2
		# sell wheat
		money += wheat * 10
		
		wheat = 0
		corn = 0
		
		Main.cash = money
		Main.numofcorn = corn
		Main.numofwheat = wheat
		

