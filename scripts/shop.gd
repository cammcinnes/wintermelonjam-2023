extends StaticBody2D

func _ready():
	$worker.play("default")
	
func _on_area_2d_body_entered(body):
	if body.has_method("player_shop_method"):
		print("Open Shop")
