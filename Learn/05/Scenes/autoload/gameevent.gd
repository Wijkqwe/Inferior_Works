class_name gameevent
extends Node

signal building_placed_event_handler(_building_component : building_component)
#var instance : gameevent

'''
func _notification(what: int) -> void:
	if what == NOTIFICATION_SCENE_INSTANTIATED:
		instance = self
'''

func emit_building_placed_event(_building_component : building_component) -> void:
	emit_signal("building_placed_event_handler", _building_component)
