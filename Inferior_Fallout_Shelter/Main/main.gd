extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_get_title()
	pass # Replace with function body.

func _clear():
	if get_node_or_null("title") != null:
		$title.queue_free()
	if get_node_or_null("game") != null:
		$game.free()
	if get_node_or_null("over") != null:
		$over.queue_free()


func _get_title() -> void:	
	_clear()
	
	var _title = preload("res://TGO/title.tscn").instantiate()
	add_child(_title)
	$title/start.connect("pressed", Callable(self, "_get_game"))


func _get_game() -> void:
	_clear()
	
	var _game = preload("res://TGO/game.tscn").instantiate()
	_game.name = String("game")
	add_child(_game)
	$game.get_tree().paused = false
	
	_game.die.connect(_get_over)


func _get_over(score: int) -> void:
	$game.get_tree().paused = true
	print($game.get_tree_string_pretty())
	#$game.queue_free()
	var _over = preload("res://TGO/over.tscn").instantiate()
	add_child(_over)

	$over/score/score.text = str(score)
	$over/menu.pressed.connect(_get_title)
	$over/again.connect("pressed", Callable(self, "_get_game"))
	
