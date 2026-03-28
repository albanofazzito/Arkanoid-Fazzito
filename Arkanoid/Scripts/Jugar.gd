extends TextureButton



func _process(delta):
	if button_pressed:
		get_tree().change_scene_to_file("res://Escenas/Escenario.tscn")
