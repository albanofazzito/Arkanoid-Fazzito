extends Area2D

var pelota
var plataforma
func _ready():
	pelota= get_parent().get_node("Node2D")
	plataforma= get_parent().get_node("CharacterBody2D")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_body_entered(body):
	Autoload.vidas-=1
	pelota.set_position(plataforma.get_position() + Vector2(0,-30))
	
