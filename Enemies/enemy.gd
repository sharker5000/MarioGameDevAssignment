extends CharacterBody2D
const SPEED = 30
var direction = -1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $RayCast2D.is_colliding():
		turn()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity.x = direction * SPEED
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

func turn():
	direction = direction * -1
	$Sprite2D.flip_h
	$RayCast2D.target_position.x = $RayCast2D.target_position.x * -1
