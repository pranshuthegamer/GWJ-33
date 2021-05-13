extends Area2D

var speed = 750
var damage = null

func _physics_process(delta):
	position += transform.x * speed * delta


func _on_bullet_body_entered(body):
	queue_free()
	body.hit(damage)


func _enter_tree():
	var time = Timer.new()
	time.connect("timeout",self,"_on_timer_timeout")
	add_child(time)
	time.start(1)

func _on_timer_timeout():
	queue_free()
