extends CharacterBody2D

var velocidad:= Vector2(300,400)
var ladrillos
var plataforma
var romperLadrilloSonido
func _ready():
	ladrillos= get_parent().get_node("Ladrillos/LadrillosTile")
	plataforma= get_parent().get_node("CharacterBody2D")
	romperLadrilloSonido= get_parent().get_node("RomperLadrillo")



func _physics_process(delta):
	if Autoload.juego_andando==true: 
		if velocidad== Vector2(0,0):
			velocidad= Vector2(300,400)
		else:
			var colision= move_and_collide(velocidad*delta)
			if colision != null:
				rebotar(colision)
				if colision.get_collider()==ladrillos:
					romperLadrillo(colision)
	else: 
		velocidad= Vector2(0,0)

	
	
func rebotar(colision):
	var diferencia = colision.get_position().x - plataforma.global_position.x
	velocidad= velocidad.bounce(colision.get_normal( ))
	if colision.get_collider()==plataforma:
		velocidad.x= diferencia * 15


func romperLadrillo(colision):
	var ladrillos_ubi=ladrillos.local_to_map(ladrillos.to_local(colision.get_position() + (-colision.get_normal()*0.3)))
	ladrillos.erase_cell(ladrillos_ubi)
	Autoload.puntaje+=1
	romperLadrilloSonido.play()
