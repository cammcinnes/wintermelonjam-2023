extends StaticBody2D

func _process(_delta):
	change_scene()



func _on_house_entrance_body_entered(body):
	if body.has_method("move_player"):
		Main.transition_scene = true


func change_scene():
	if Main.transition_scene:
		if Main.curr_scene == "farm":
			$player.position = $house_load_pos.position
			$player/theme.stop()
			$inside_house/house_music.play()
			$house_scene.make_current()
			Main.curr_scene = "house"
			Main.transition_scene = false
		elif Main.curr_scene == "house":
			$player.position = $farm_load_pos.position
			$inside_house/house_music.stop()
			$player/theme.play()
			Main.curr_scene = "farm"
			$player.position = $farm_load_pos.position
			$main_scene.make_current()
			Main.transition_scene = false
