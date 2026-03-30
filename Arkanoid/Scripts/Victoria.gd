extends CanvasLayer

var SonidoVictoria
var limite
var musica
func _ready():
	limite=1
	musica= get_parent().get_node("AudioStreamPlayer2D")
	SonidoVictoria= get_parent().get_node("VictoriaSonido")


func _process(delta):
	if Autoload.puntaje==40:
		if limite==1:
			SonidoVictoria.play()
			musica.stop()
			limite+=1
		visible=true
		Autoload.juego_andando=false
		
