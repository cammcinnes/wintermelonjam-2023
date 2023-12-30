extends CharacterBody2D

@export var speed = 400;
var screen_size;

#direction sprite is facing
var direction;
const UP = Vector2(0, -1)
const DOWN = Vector2(0, 1)
const RIGHT = Vector2(1, 0)
const LEFT = Vector2(-1, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	direction = DOWN

func start(pos):
	position = pos
	show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Movement
	var input_direction = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	velocity = input_direction * speed
	
	# Change Direction 
	if (input_direction == UP):
		direction = UP
	elif (input_direction == DOWN):
		direction = DOWN
	elif (input_direction == RIGHT):
		direction = RIGHT
	elif (input_direction == LEFT):
		direction = LEFT
	move_and_slide()
	
	# Animations
	if Input.is_action_pressed("move_down"):
		$AnimatedSprite2D.play("walk_down")
	elif Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.play("walk_right")
	elif Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.play("walk_right")
	elif Input.is_action_pressed("move_up"):
		$AnimatedSprite2D.play("walk_up")
	else:
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
		# flip the texture if walking in negative direction
		$AnimatedSprite2D.flip_h = velocity.x < 0

	#position = position.clamp(Vector2.ZERO, screen_size)

