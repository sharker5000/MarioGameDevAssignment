extends Node

@onready var game_manager = %gamemanager

func _process(delta: float):
	#print(ingredients)
	$Label.text = "Lives: %s" % [Lives.lives]
	$Label2.text = "Ingredients: %s" % [game_manager.ingredients]
