extends CharacterBody2D

const velocidad = 500.0

func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")

	if direction:
		position.x += direction * velocidad * delta
	else:
		velocity.x = 0

	velocity.y = 0

	move_and_slide()
