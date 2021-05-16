extends Node

var Menu = preload("res://Scenes/Not Levels/Menu.tscn").instance()
var Char = preload("res://Scenes/Entity/Entity.tscn").instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	$"/root/Main".add_child(Menu)
	$"/root/Main".add_child(Char)

func _cng_scene(scene,caller):
	var tempscene = load(scene).instance()
	caller.get_parent().add_child(tempscene)
	caller.queue_free()
