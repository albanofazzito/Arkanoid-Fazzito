extends TextureRect


var slider
var texturas
func _ready():
	texturas = [preload("res://Sprites/SonidoCero.png"), preload("res://Sprites/SonidoBajo.png"), preload("res://Sprites/SonidoMedio.png"), preload("res://Sprites/SonidoAlto.png")]
	slider= get_parent().get_node("Panel2/HSlider")
	texture = texturas[3]





func _on_h_slider_value_changed(value):
	var volumen= int(value)/30
	if value!=0 and value<30:
		volumen=1
	texture = texturas[volumen]
	if value == 0:
		AudioServer.set_bus_volume_db(0, -80)  
	else:
		AudioServer.set_bus_volume_db(0, linear_to_db(value / 100.0))
	
