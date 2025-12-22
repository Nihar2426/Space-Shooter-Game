extends CharacterBody2D

signal laser(pos)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(400,455)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var speed: int = 550
	var direction = Input.get_vector("Left","Right","Up","Down")
	if Input.is_action_pressed("Shift"):
		speed = 900
		velocity = direction*speed
		move_and_slide()
	else :
		velocity = direction*speed
		move_and_slide()
	
	#Laser Input
	if Input.is_action_pressed("Shoot"):
		laser.emit($Laser_start_position.global_position)



func _on_p_area_area_entered(area: Area2D) -> void:
	area.queue_free()
