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
	if direction == UP:
		$AnimatedSprite2D.play("walk_up")
	elif direction == DOWN:
		$AnimatedSprite2D.play("walk_down")
	elif direction == RIGHT:
		$AnimatedSprite2D.play("walk_right")
		$AnimatedSprite2D.flip_h = false
	elif direction == LEFT:
		$AnimatedSprite2D.play("walk_right")
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.play("idle")

	if velocity.x != 0:
		$AnimatedSprite2D.flip_h = velocity.x < 0
