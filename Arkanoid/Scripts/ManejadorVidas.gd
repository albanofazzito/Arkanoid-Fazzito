extends Area2D

var pelota
var plataforma
var GameOver
var vidaPerdida
func _ready():
	GameOver= get_parent().get_node("GameOver")
	pelota= get_parent().get_node("Node2D")
	plataforma= get_parent().get_node("CharacterBody2D")
	vidaPerdida= get_parent().get_node("VidaPerdida")
	Autoload.vidas=3
	Autoload.puntaje=0
	Autoload.juego_andando=false


func _on_body_entered(body):
	Autoload.vidas-=1
	vidaPerdida.play()
	if Autoload.vidas!=0:
		pelota.set_position(plataforma.get_position() + Vector2(0,-30))
	else:
		GameOver.visible=true
		Autoload.juego_andando=false
		

	
		
	
