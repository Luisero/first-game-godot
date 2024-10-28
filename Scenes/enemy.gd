extends Node2D

const SPEED = 80
var direction = 1
@onready var left_raycast: RayCast2D = $LeftRaycast
@onready var right_raycast: RayCast2D = $RightRaycast
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.x +=direction * SPEED * delta
	
	if right_raycast.is_colliding():
		$'AnimatedSprite2D'.flip_h =true
		direction =-1
	elif left_raycast.is_colliding():
		direction = 1
		$'AnimatedSprite2D'.flip_h = false
