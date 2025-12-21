extends Area2D

@export var speed = 800

func _process(delta: float) -> void:
	position.y -= speed*delta


func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()
	Global.score += 1
	
