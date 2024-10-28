extends CharacterBody2D


const SPEED = 150
const JUMP_VELOCITY = -300.0
var time = 0
var coins = 0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var can_double_jump = true 
var has_double_jump = false
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	
	
	# Handle jump.
	
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			can_double_jump = true 
		elif can_double_jump and has_double_jump:
			velocity.y = JUMP_VELOCITY
			can_double_jump = false
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if is_on_floor():
		if direction == 0 :
			animated_sprite_2d.play('idle')
		else:
			animated_sprite_2d.play('run')
			
	else:
		animated_sprite_2d.play('jump')
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if direction > 0:
		$'AnimatedSprite2D'.flip_h = false 
	elif direction < 0:
		$'AnimatedSprite2D'.flip_h = true   
	
	print(self.coins)
	move_and_slide()
