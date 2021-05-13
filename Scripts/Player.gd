extends KinematicBody2D

export var speed = 40
var velocity = Vector2()
var shooting = false
var ShootingSpeed = 0.15
var ShotSpeed = 0
var move_and_slide

var health = 100

var bullet = preload("res://Scenes/bullet.tscn")

func _process(delta):
	ShotSpeed += delta
	
	if health <= 0:
		Auto.died()
	look_at(get_global_mouse_position())
	
	#if the shot cooldown is met, the player shoots
	if shooting and ShotSpeed >= ShootingSpeed:
		position -= transform.x * 2
		var shot = bullet.instance()
		get_node("/root/Main").add_child(shot)
		shot.damage = 10
		shot.transform = $Barrel.global_transform
		ShotSpeed = 0
	
	#checks if you released left click
	if Input.is_action_just_released("click"):
		shooting = false


func _physics_process(delta):
	get_input()
	move_and_slide = move_and_slide(velocity)

#Shooting
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.is_action("click") and get_node("/root/Main").ingame == true:
		shooting = true

#Reduces Health
func hit(damage):
	health = health - damage
	print(health)

#Player Movement
func get_input():
	var shift = 1
	velocity = Vector2()
	if Input.is_action_pressed('ui_right2'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left2'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down2'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up2'):
		velocity.y -= 1
	if Input.is_key_pressed(KEY_SHIFT):
		shift = 1.5
	velocity = velocity.normalized() * speed * shift
