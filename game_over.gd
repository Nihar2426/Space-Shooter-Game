extends Node2D


func _ready() -> void:
	$Sprite2D/TE.text = $Sprite2D/TE.text + str(Global.time_elapsed) + " s"
	$Sprite2D/Score.text = $Sprite2D/Score.text + str(Global.score)
	
#func _process(_delta: float) -> void:
	#if Input.is_action_just_pressed("Shoot"):
		#get_tree().change_scene_to_packed(level_scene)
	$GameOverTrack.play()
	
func _input(event) -> void:
	if event.is_action_pressed("Shoot"):
		get_tree().change_scene_to_file("res://level.tscn")
