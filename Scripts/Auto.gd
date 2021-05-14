extends Node

var character = preload("res://Scenes/Player.tscn").instance()
var menu = preload("res://Scenes/Menu.tscn")
var death = preload("res://Scenes/Death.tscn")
var enemy = preload("res://Scenes/Enemy.tscn")

func _enter_tree():
	#This will add the character to the root
	get_node("/root/Main").add_child(menu.instance())
	get_node("/root/Main").add_child(death.instance())
	$"/root/Main".add_child(character)
	$"/root/Main/Death".hide()

#called if you wanna change scene
func change_scene_from_level(scene,objectt):
	var tempscene = load(scene).instance()
	#moves charecter from wherever it is to the next level
	character.get_parent().remove_child(character)
	objectt.queue_free()
	$"/root/Main".add_child(tempscene)
	tempscene.add_child(character)
	


func died():
	$"/root/Main/Death".show()

func respawn():
	character.health = 100
	$"/root/Main/Death".hide()

