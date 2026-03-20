extends CharacterBody2D

var velocidad:= Vector2(200,300)
var ladrillos
func _ready():
	ladrillos= get_parent().get_node("Ladrillos/LadrillosTile")



func _physics_process(delta):

	var colision= move_and_collide(velocidad*delta)
	if colision != null:
		rebotar(colision)
		romperLadrillo(colision)
		

func rebotar(colision):
	velocidad= velocidad.bounce(colision.get_normal())
	
func romperLadrillo(colision):
	var ladrillos_ubi=ladrillos.local_to_map(ladrillos.to_local(colision.get_position() + (-colision.get_normal()*0.3)))
	ladrillos.erase_cell(ladrillos_ubi)
