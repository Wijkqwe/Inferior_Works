extends Node2D


@onready var _test_05_tile = $test_05_tile


var _have_set : Array = []


func _process(delta: float) -> void:
	
	pass


func _on_button_pressed() -> void:
	if _test_05_tile.process_mode == Node.PROCESS_MODE_DISABLED:
		_test_05_tile.process_mode = Node.PROCESS_MODE_INHERIT
		_test_05_tile.visible = true
	else:
		_test_05_tile.process_mode = Node.PROCESS_MODE_DISABLED
		_test_05_tile.visible = false
	'''
	if get_node_or_null("test_05_tile"):
		$test_05_tile.queue_free()
	else:
		var _TEST_05_BUILD

func _ready() -> void:
	passING_UNREAL = preload("res://test_05_tile.tscn").instantiate()
		add_child(_TEST_05_BUILDING_UNREAL)
	'''




