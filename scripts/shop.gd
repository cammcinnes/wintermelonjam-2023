extends StaticBody2D

func _ready():
	self.visible = false
	$worker.play("default")
	$shopmenu.visible = false
	$corn_seed.visible = false
	$wheat_seed.visible = false
	
func _process(delta):
	if Main.ingame:
		self.visible = true
	if $shopmenu.item4owned == true:
		Main.game_over()
		$shopmenu.visible = false
		$shopmenu.item4owned = false
	
		
func _on_area_2d_body_entered(body):
	if body.has_method("player_shop_method"):
		$shopmenu.visible = true

func _on_area_2d_body_exited(body):
	if body.has_method("player_shop_method"):
		$shopmenu.visible = false
