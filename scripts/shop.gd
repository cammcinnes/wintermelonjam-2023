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
	if $shopmenu.item1owned == true:
		$corn_seed.visible = true
	if $shopmenu.item2owned == true:
		$wheat_seed.visible = true
	if $shopmenu.item4owned == true:
		Main.game_over()
		$shopmenu.visible = false
		$shopmenu.item4owned = false
	if $corn_seed.planted == true:
		corn_redo()
	if $wheat_seed.planted == true:
		wheat_redo()
	
		
func _on_area_2d_body_entered(body):
	if body.has_method("player_shop_method"):
		$shopmenu.visible = true

func _on_area_2d_body_exited(body):
	if body.has_method("player_shop_method"):
		$shopmenu.visible = false

func corn_redo():
	$corn_seed.position = $pickup.position
	$corn_seed.visible = false
	$shopmenu.item1owned = false
	$corn_seed.planted = false

func wheat_redo():
	$wheat_seed.position = $pickup.position
	$wheat_seed.visible = false
	$shopmenu.item2owned = false
	$wheat_seed.planted = false
