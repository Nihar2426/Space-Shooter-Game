extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	var width = 800
	var random_x = rng.randi_range(70, width-70)
	var random_y = rng.randi_range(-160,-60)
	position = Vector2(random_x,random_y)
	
var random_rotate = RandomNumberGenerator.new().randf_range(-0.3,0.3)
var random_speed = RandomNumberGenerator.new().randi_range(480,510)
var random_dir = RandomNumberGenerator.new().randf_range(-0.3,0.3)

func _process(delta):
	position += Vector2(random_dir,1.0)*random_speed*delta
	rotation += random_rotate*delta
