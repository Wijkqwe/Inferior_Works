extends CanvasLayer


@onready var sprite_2d = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sprite_2d.global_position = sprite_2d.get_global_mouse_position()
	pass
