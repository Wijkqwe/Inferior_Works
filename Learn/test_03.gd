extends Node2D

@onready var _tile_map: TileMap = $TileMap

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var _mouse_pos : Vector2 = get_global_mouse_position()
		var _tile_mouse_pos : Vector2i = _tile_map.local_to_map(_mouse_pos)
		var _sourse_id : int = 0
		var _atlas_coord : Vector2i = Vector2i(0, 0)
		
		print(_tile_mouse_pos)
		
		_tile_map.set_cell(0, _tile_mouse_pos, _sourse_id, _atlas_coord, 3)
	
	if event.is_action_pressed("ui_cancel"):
		var _mouse_pos : Vector2 = get_global_mouse_position()
		var _tile_mouse_pos : Vector2i = _tile_map.local_to_map(_mouse_pos)
		var _sourse_id : int = 0
		var _atlas_coord : Vector2i = Vector2i(0, 0)
		
		print(_tile_mouse_pos)
		
		_tile_map.set_cell(0, _tile_mouse_pos)
	
