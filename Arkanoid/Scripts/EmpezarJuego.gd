extends CanvasLayer



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		Autoload.juego_andando=true
		visible=false
