extends Area2D

@onready var game_manager = %gamemanager

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.win()
		$CPUParticles2D.emitting = true
		$Timer.start()


func _on_timer_timeout() -> void:
	if game_manager.ingredients > 6:
		get_tree().change_scene_to_file("res://Levels/winscreen.tscn")
	else:
		get_tree().change_scene_to_file("res://Levels/winscreen2.tscn")
