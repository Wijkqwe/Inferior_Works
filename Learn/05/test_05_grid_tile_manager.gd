extends Node


@export var _base_tile_map : TileMap

#local_to_tile_position
var _valid_buildable_tiles : Dictionary = {}

func _ready() -> void:
	GameEvent.building_placed_event_handler.connect(_on_building_placed)
	pass


func _process(delta: float) -> void:
	pass


func highlight_buildable_tile() -> void:
	for i in _valid_buildable_tiles.keys():
		_base_tile_map.set_cell(1, i, 1, Vector2i(0, 0), 0)


func highlight_expended_buildable_tile(_root_cell : Vector2i, _radius : int) -> void:
	clear_highlight()
	highlight_buildable_tile()
	
	var _valid_dic = _get_valid_tile_in_radius(_root_cell, _radius)
	for i in _valid_buildable_tiles.keys():
		if _valid_dic.has(i):
			_valid_dic.erase(i)
	var comps = get_tree().get_nodes_in_group("buildingcompent")
	for i in comps:
		if _valid_dic.has(i.get_cell_position()):
			_valid_dic.erase(i.get_cell_position())
	
	for i in _valid_dic.keys():
		_base_tile_map.set_cell(1, i, 1, Vector2i(1, 2), 0)


func is_tile_on_valid(_tile_position : Vector2i) -> bool:
	var _tile_data = _base_tile_map.get_cell_tile_data(0, _tile_position)
	if _tile_data == null:
		return false
	return _tile_data.get_custom_data("buildable") && 1


func is_tile_position_buildable(_tile_position : Vector2i) -> bool:
	return _valid_buildable_tiles.has(_tile_position)


func clear_highlight() -> void:
	_base_tile_map.clear_layer(1)


func _update_valid_buildable_tiles(_building_component : building_component) -> void:
	var _root_tile_position = _building_component.get_cell_position()
	_valid_buildable_tiles.merge(_get_valid_tile_in_radius(_root_tile_position, _building_component._buildable_radius))
	
	var comps = get_tree().get_nodes_in_group("buildingcompent")
	for i in comps:
		_valid_buildable_tiles.erase(i.get_cell_position())


func _get_valid_tile_in_radius(_root_cell : Vector2i, _radius : int) -> Dictionary:
	var res : Dictionary = {}
	for i in range(-_radius, _radius + 1):
		for j in range(-_radius, _radius + 1):
			var _radius_tile_position : Vector2i = _root_cell + Vector2i(i, j)
			if (is_tile_on_valid(_radius_tile_position)) && !_valid_buildable_tiles.has(_radius_tile_position):
				res[_radius_tile_position] = _radius_tile_position
	return res


func _on_building_placed(_building_component : building_component) -> void:
	_update_valid_buildable_tiles(_building_component)
