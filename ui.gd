extends CanvasLayer

static var life = load("res://Graphics/Life.png")
static var earth = load("res://Graphics/Earth.png")


func set_health(amount):
	#Remove all children in Vbox container for health
	for child in $VBoxContainer.get_children():
		child.queue_free()
	
	#Add children in Vbox container according to amount of total health
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = life
		$VBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
		
func set_earth(amount):
	for child in $Earth_health.get_children():
		child.queue_free()
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = earth
		$Earth_health.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP

func _on_score_timer_timeout() -> void:
	Global.time_elapsed += 1
