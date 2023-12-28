extends CharacterBody2D
var speed = 100;
var player_chase = false;
var player

func _physics_process(delta):
	if player_chase:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		move_and_collide(velocity * delta)
		$AnimatedSprite2D.play("walk")
	else: 
		$AnimatedSprite2D.play("idle")
		

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

func _on_detection_area_body_exited(body):
	player = null
	player_chase = false;
