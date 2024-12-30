extends Node


@export var _base_tile_map : TileMap

#tile_position
var _occupied_cell : Array = []


func _ready() -> void:
	GameEvent.building_placed_event_handler.connect(_on_building_placed)
	pass


func _process(delta: float) -> void:
	pass


func highlight_buildable_tile() -> void:
	clear_highlight()
	
	var _buildcomponents = get_tree().get_nodes_in_group("buildingcompent")
	
	for i in _buildcomponents:
		_highlight_tiles_in_radius(i.get_cell_position(), i._buildable_radius)


func mark_tile_as_occupied(_tile_position : Vector2i) -> void:
	_occupied_cell.append(_tile_position)


func clear_highlight() -> void:
	_base_tile_map.clear_layer(1)


func _highlight_tiles_in_radius(_root_tile_position : Vector2i, _radius : int) -> void:
	for i in range(-_radius, _radius + 1):
		for j in range(-_radius, _radius + 1):
			var _tile_mouse_position_i : Vector2i = _root_tile_position + Vector2i(i, j)
			if (is_tile_on_valid(_tile_mouse_position_i)):
				_base_tile_map.set_cell(1, _tile_mouse_position_i, 1, Vector2i(0, 0), 0)


func is_tile_on_valid(_tile_position : Vector2i) -> bool:
	var _tile_data = _base_tile_map.get_cell_tile_data(0, _tile_position)
	if _tile_data == null:
		return false
	if !(_tile_data.get_custom_data("buildable") && 1):
		return false
	
	return _occupied_cell.find(_tile_position) == -1


func _on_building_placed(_building_component : building_component) -> void:
	mark_tile_as_occupied(_building_component.get_cell_position())
