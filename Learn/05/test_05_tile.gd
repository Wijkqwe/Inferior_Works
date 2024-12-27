extends Node2D



@onready var _tile_map: TileMap = $TileMap
@onready var _test_05_building_unreal: Sprite2D = $test_05_building_unreal
@onready var _test_05 = $".."
@onready var _base_tile_map = $"../BaseTileMap"
@onready var _test_05_grid_tile_manager: Node = $"../test_05_grid_tile_manager"


var _mouse_position: Vector2i


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	visible = false
	print("123")


func _process(delta: float) -> void:
	_mouse_position = get_global_mouse_position() / 32
	_test_05_building_unreal.global_position = _mouse_position * 32
	print((_mouse_position))
	
	_update_hightlight_tile()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		var _par = get_parent()
		
		if _test_05_grid_tile_manager._is_tile_on_valid(_mouse_position):
			var _TEST_05_BUILDING = preload("res://05/test_05_building.tscn").instantiate()
			_TEST_05_BUILDING.global_position = _test_05_building_unreal.global_position
			_par.add_child(_TEST_05_BUILDING)
			_par._have_set.append(_test_05_building_unreal.global_position)
		else:
			pass


func _update_hightlight_tile() -> void:
	_tile_map.clear()
	
	var _tile_mouse_position : Vector2i = _tile_map.local_to_map(_test_05_building_unreal.global_position)
	for i in range(-3, 3):
		for j in range(-3, 3):
			var _tile_mouse_position_i : Vector2i = _tile_mouse_position + Vector2i(i, j)
			if _test_05_grid_tile_manager._is_tile_on_valid(_tile_mouse_position_i):
				_tile_map.set_cell(0, _tile_mouse_position_i, 1, Vector2i(0, 0), 0)
			








