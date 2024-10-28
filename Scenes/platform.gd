extends AnimatableBody2D

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var time = rng.randi_range(0,30)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	self.position.x += sin(time/20)*2
	#self.position.y += sin(time/20)/2
	
	time+=.5
