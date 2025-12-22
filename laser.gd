extends Area2D

@export var speed = 800

func _process(delta: float) -> void:
	position.y -= speed*delta


func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	$HitMeteor.play()
	$Sprite2D.hide()
	await get_tree().create_timer(0.2).timeout
	queue_free()
	Global.score += 1
