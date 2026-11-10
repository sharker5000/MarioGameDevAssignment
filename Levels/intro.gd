extends Node2D

func _on_texture_button_pressed() -> void:
	Lives.reset_lives()
	get_tree().change_scene_to_file("res://Levels/level_1_1.tscn")
