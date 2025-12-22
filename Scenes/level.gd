extends Node2D

# 1. Load the scene (Imagine this as the blueprint)
var meteor_scene: PackedScene = load("res://Scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://laser.tscn")
var health: int = 5
var earth: int = 5

func _ready() :
	#$BgTrack.play()
	
	#reset score and time_elapsed
	Global.time_elapsed = 0
	Global.score = 0
	#Set up health ui
	get_tree().call_group('ui','set_health',health)
	get_tree().call_group('ui','set_earth',earth)
	#stars
	var size := get_viewport().get_visible_rect().size
	var rng := RandomNumberGenerator.new()
	for star in $Stars.get_children() :
		#position
		var random_x = rng.randi_range(0,int(size.x))
		var random_y = rng.randi_range(0,480)
		star.position = Vector2(random_x,random_y)
		
		#scale
		var random_scale = rng.randf_range(0.5,1.7)
		star.scale = Vector2(random_scale,random_scale)
		
		#Animation speed
		star.speed_scale = rng.randf_range(0.6,1.4)
	
func _on_meteor_timer_timeout() -> void:
	
	#2. Create an instance from the blueprint
	var meteor = meteor_scene.instantiate()
	
	#3. Attach node to scene tree
	$Meteors.add_child(meteor)
	
	#connect the signal
	meteor.connect('collision', _on_meteor_collision)
	
func _on_meteor_collision():
	$ExplosionSound.play()
	health -= 1
	get_tree().call_group('ui','set_health',health)
	if health <=0:
		get_tree().change_scene_to_file("res://Game over.tscn")


func _on_player_laser(pos) -> void:
	if $Laser_timer.is_stopped():
		if Input.is_action_just_pressed("Shoot"):
			$Laser_timer.start()
			var laser = laser_scene.instantiate()
			$Lasers.add_child(laser)
			laser.position = pos
	

func _on_bottom_area_area_entered(area: Area2D) -> void:
	area.queue_free()
	earth -= 1
	get_tree().call_group('ui','set_earth',earth)
	if earth <= 0:
		get_tree().change_scene_to_file("res://Game over.tscn")


func _on_sc_updater_timeout() -> void:
	$Sc.text = str(Global.score)


#func _on_bg_track_finished() -> void:
#	$BgTrack.play()
