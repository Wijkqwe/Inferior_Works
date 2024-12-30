extends Node2D


@onready var test_05_grid_tile_manager: Node = $test_05_grid_tile_manager
@onready var cursor: Sprite2D = $Cursor

const _TEST_05_BUILDING = preload("res://05/test_05_building.tscn")


func _ready() -> void:
	cursor.visible = false


func _process(delta: float) -> void:
	if cursor.visible:
		cursor.position = Vector2i(get_global_mouse_position() / 32) * 32
		test_05_grid_tile_manager.highlight_buildable_tile()
		
		print(test_05_grid_tile_manager.is_tile_on_valid(cursor.position / 32))

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse_left") and test_05_grid_tile_manager.is_tile_on_valid(cursor.position / 32) and cursor.visible:
		cursor.visible = false
		_place_building()


func _place_building() -> void:
	var _building_in = _TEST_05_BUILDING.instantiate()
	_building_in.global_position = cursor.position
	add_child(_building_in)
	
	test_05_grid_tile_manager.mark_tile_as_occupied(_building_in.global_position)
	test_05_grid_tile_manager.clear_highlight()



func _on_button_pressed() -> void:
	cursor.visible = !cursor.visible
	'''
	if get_node_or_null("test_05_tile"):
		$test_05_tile.queue_free()
	else:
		var _TEST_05_BUILD

func _ready() -> void:
	passING_UNREAL = preload("res://test_05_tile.tscn").instantiate()
		add_child(_TEST_05_BUILDING_UNREAL)
	'''
