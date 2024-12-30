class_name building_component
extends Node2D


@export var _buildable_radius : int


func _ready() -> void:
	add_to_group("buildingcompent")
	GameEvent.emit_building_placed_event(self)
	

func get_cell_position() -> Vector2i:
	return global_position / 32
