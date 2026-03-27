extends CharacterBody2D

var velocidad:= Vector2(200,300)
var ladrillos
var plataforma
func _ready():
	ladrillos= get_parent().get_node("Ladrillos/LadrillosTile")
	plataforma= get_parent().get_node("CharacterBody2D")



func _physics_process(delta):

	var colision= move_and_collide(velocidad*delta)
	if colision != null:
		rebotar(colision)
		if colision.get_collider()==ladrillos:
			romperLadrillo(colision)
		

	
	
func rebotar(colision):
	var diferencia = colision.get_position().x - plataforma.global_position.x
	velocidad= velocidad.bounce(colision.get_normal( ))
	if colision.get_collider()==plataforma:
		print(diferencia)
		velocidad.x= diferencia * 15
		
	
func romperLadrillo(colision):
	var ladrillos_ubi=ladrillos.local_to_map(ladrillos.to_local(colision.get_position() + (-colision.get_normal()*0.3)))
	ladrillos.erase_cell(ladrillos_ubi)
	Autoload.puntaje+=1
