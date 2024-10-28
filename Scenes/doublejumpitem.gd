extends Area2D

@onready var timer: Timer = $Timer
var body = null 
func _on_body_entered(body: Node2D) -> void:
	body.has_double_jump = true
	timer.start()
	
	remove_collision_and_sprite()
	
	
func remove_collision_and_sprite():
	$AnimatedSprite2D.queue_free()
	$CollisionShape2D.queue_free()


func _on_timer_timeout() -> void:
	$"../Player".has_double_jump = false
	queue_free()
