extends Node

var character = preload("res://Scenes/Player.tscn")
var menu = preload("res://Scenes/Menu.tscn")
var death = preload("res://Scenes/Death.tscn")
var enemy = preload("res://Scenes/Enemy.tscn")
var tempscene = null

func _enter_tree():
	get_node("/root/Main").add_child(menu.instance())
	get_node("/root/Main").add_child(death.instance())
	$"/root/Main/Death".hide()

#called if you wanna change scene
func change_scene_from_level(scene,objectt):
	var tempscene = load(scene).instance()
	tempscene.add_child(character.instance())
	tempscene.add_child(enemy.instance())
	objectt.get_parent().add_child(tempscene)
	print(objectt.name ," requested to change scene to ",scene)
	objectt.queue_free()

func died():
	$"/root/Main/Death".show()

func respawn():
	$"/root/Main/Player".health = 100
	$"/root/Main/Death".hide()

