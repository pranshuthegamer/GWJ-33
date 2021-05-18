extends TileMap


onready var player: Area2D = $Player

func _ready() -> void:
	var center_grid := Vector2(14, 6) * cell_size
#	player.position = center_grid + (cell_size / 2)

