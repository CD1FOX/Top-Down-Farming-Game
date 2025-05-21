extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@export var speed = 100.0

var input_vector := Vector2.ZERO

func _physics_process(_delta: float) -> void:
	player_movement()
	move_and_slide()
	play_animation(input_vector)

func player_movement():
	input_vector = Vector2.ZERO
	
	if Input.is_action_pressed("Up"):
		input_vector.y -= 1
	if Input.is_action_pressed("Down"):
		input_vector.y += 1
	if Input.is_action_pressed("Left"):
		input_vector.x -= 1
	if Input.is_action_pressed("Right"):
		input_vector.x += 1
	
	input_vector = input_vector.normalized()
	velocity = input_vector * speed
	return input_vector
	
func play_animation(direction: Vector2):
	if direction == Vector2.ZERO:
		animated_sprite.stop()
		return
		
	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			animated_sprite.play("Right")
		else:
			animated_sprite.play("Left")
	else:
		if direction.y > 0:
			animated_sprite.play("Down")
		else:
			animated_sprite.play("Up")
