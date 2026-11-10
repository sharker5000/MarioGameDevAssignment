extends CharacterBody2D


var speed = 150.0
const JUMP_VELOCITY = -330.0

@onready var game_manager = %gamemanager

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if velocity.y > 0:
		$stompbox/hitbox.disabled = false
	else:
		$stompbox/hitbox.disabled = true

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()

func die():
	$Sprite2D.modulate = Color.WEB_MAROON
	speed = 0
	$CollisionShape2D.queue_free()
	$Timer.start()

func win():
	speed = 0

func _on_timer_timeout() -> void:
	if Lives.lives > 1:
		Lives.remove_lives()
		get_tree().reload_current_scene()
	else:
		Lives.reset_lives()
		get_tree().change_scene_to_file("res://Levels/gameover.tscn")

func _on_stompbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.queue_free()
		velocity.y = -200
