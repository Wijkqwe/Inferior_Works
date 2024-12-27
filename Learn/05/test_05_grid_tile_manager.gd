extends Node


@export var _base_tile_map : TileMap

var _have_set : Array = []


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _is_tile_on_valid(_tile_posiotn : Vector2i) -> bool:
	var _tile_data = _base_tile_map.get_cell_tile_data(0, _tile_posiotn)
	if _tile_data == null:
		return false
	if !(_tile_data.get_custom_data("buildable") && 1):
		return false
	
	return _have_set.find(_tile_posiotn) == -1

