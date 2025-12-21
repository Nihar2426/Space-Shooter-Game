extends Area2D

signal collision

func _ready():
	var path: String = "res://Graphics/Meteor_0" + str(RandomNumberGenerator.new().randi_range(0,2)) + ".png"
	$"00".texture = load(path)
	var rng:= RandomNumberGenerator.new()
	# Start position
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(70, (width-70))
	var random_y = rng.randi_range(-160,-60)
	position = Vector2(random_x,random_y)
	
var random_rotate = RandomNumberGenerator.new().randf_range(-7,7)
var random_speed = RandomNumberGenerator.new().randi_range(360,520)
var random_dir = RandomNumberGenerator.new().randf_range(-0.3,0.3)

func _process(delta):
	position += Vector2(random_dir,1.0)*random_speed*delta
	rotation += random_rotate*delta
	
func _on_body_entered(_body):
	collision.emit()
	
