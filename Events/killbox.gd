extends Area2D

@onready var timer = $Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body: Node2D) -> void:
	if body.has_method("die"):
		body.die()
