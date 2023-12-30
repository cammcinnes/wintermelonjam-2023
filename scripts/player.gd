extends CharacterBody2D

@export var speed = 400
var screen_size
var direction;
const UP = Vector2(0, -1)
const DOWN = Vector2(0, 1)
const RIGHT = Vector2(1, 0)
const LEFT = Vector2(-1, 0)

func _ready():
	screen_size = get_viewport_rect().size
	direction = DOWN

func start(pos):
	position = pos
	show()

func _physics_process(delta):
	# Movement
	var input_direction = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	velocity = input_direction * speed

	# Update direction based on input
	if input_direction.length_squared() > 0:
		direction = input_direction.normalized()
	
	move_and_slide()

	# Clamp the player's position to the screen boundaries
	var new_position = position
	new_position.x = clamp(new_position.x, 10, screen_size.x - 10)
	new_position.y = clamp(new_position.y, 5, screen_size.y - 20)
	position = new_position

	# Animations
	update_animations()

func update_animations():
	if Input.is_action_pressed("move_down"):
		$AnimatedSprite2D.play("walk_down")
	elif Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.play("walk_right")
	elif Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.play("walk_right")
	elif Input.is_action_pressed("move_up"):
		$AnimatedSprite2D.play("walk_up")
	else:
		$AnimatedSprite2D.play("idle")
		if (direction == DOWN):
			$AnimatedSprite2D.play("idle")
		elif (direction == RIGHT):
			$AnimatedSprite2D.play("idle_right")
		elif (direction == LEFT):
			$AnimatedSprite2D.play("idle_right")
			$AnimatedSprite2D.flip_h = true;
		elif (direction == UP):
			$AnimatedSprite2D.play("idle_up")

	if velocity.x != 0:
		$AnimatedSprite2D.flip_h = velocity.x < 0

func player_sell_method():
	pass
