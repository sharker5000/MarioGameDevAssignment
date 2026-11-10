extends CharacterBody2D

@onready var game_manager = %gamemanager

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		game_manager.add_point()
		queue_free()
