extends KinematicBody2D

export var speed = 100.0
var velocity = Vector2()
var shooting = false
var ShotSpeed = 0
var move_and_slide
var recoil_timer
var recoiltime = 0
var currentweapon = 0

var recoil = 1
var damage = 1
var spray = 1
var MaxSpray = 1
var ShootingSpeed = 0.15

var health = 100

#Weapons

var weapons = [{
	"name":"SMG",
	"damage":5,
	"speed":0.04,
	"recoil":0.7,
	"spray":0.1,
	"MaxSpray":0.2},
	{
	"name":"AR",
	"damage":15,
	"speed":0.17,
	"recoil":2,
	"spray":0.05,
	"MaxSpray":0.25}
	]

#SMG



var bullet = preload("res://Scenes/Not Levels/bullet.tscn")

func _ready():
	changeWeapon()

func _process(delta):
	
	ShotSpeed += delta
	
	if health <= 0:
		Auto.died()
	look_at(get_global_mouse_position())
	
	#if the shot cooldown is met, the player shoots
	if shooting and ShotSpeed >= ShootingSpeed:
		#recoil
		position -= transform.x * recoil
		#spawns bullet
		var shot = bullet.instance()
		get_node("/root/Main").add_child(shot)
		shot.damage = damage
		shot.transform = $Barrel.global_transform
		#adds spray
		var tempspray = spray + (recoiltime/1000)
		if tempspray >= MaxSpray:
			tempspray = MaxSpray
		print(tempspray)
		shot.rotation += rand_range(-tempspray,tempspray)
		ShotSpeed = 0
	#reduces Spray as time passes without shooting
	if shooting == false:
		if recoiltime >= 0:
			recoiltime -= delta * 100
		else:
			recoiltime = 0
	else:
		recoiltime += delta
	
	#checks if you released left click
	if Input.is_action_just_released("click"):
		shooting = false


func _physics_process(_delta):
	get_input()
	move_and_slide = move_and_slide(velocity)

#Shooting
func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.is_action("click") and get_node("/root/Main").ingame == true:
		shooting = true
	if Input.is_key_pressed(KEY_K):
		changeWeapon()

#func change weapon
func changeWeapon():
	if weapons.size() - 1 <= currentweapon:
		currentweapon = 0
	else:
		currentweapon += 1
	var temp = weapons[currentweapon]
	print("Switched to ",temp["name"])
	damage = temp["damage"]
	ShootingSpeed = temp["speed"]
	spray = temp["spray"]
	ShotSpeed = 0

#Reduces Health
func hit(dmg):
	health -= dmg 
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
