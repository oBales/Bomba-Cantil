extends Personagem
class_name Enemy

var combat = false
var is_taking_dmg = false
var target
var blow
var body
@onready var animation = $AnimationPlayer

func _ready():
	pass

func _physics_process(delta):
	
	if life <= 0:
		death()
		pass
	
	if (target != null && target.name == "Personagem" and !is_taking_dmg):
		if (timer.is_stopped() == true && combat):
			target.set_life(damage)
			animation.play("Attack")
			timer.start()
		elif (!is_taking_dmg):
			animation.play("IDLE")
			pass
		pass

	var direction = get_parent().get_node("Personagem").position
	side = direction
	if direction[0] > position[0]:
		if (!combat and !is_taking_dmg):
			animation.play("Walk")
		get_node("E_Area2D2/Golpe").position[0] = 48.25
		velocity.x = speed
		$PlayerSprites.flip_h = false
	elif direction[0] < position[0]:
		if (!combat and !is_taking_dmg):
			animation.play("Walk")
		get_node("E_Area2D2/Golpe").position[0] = -48.25
		velocity.x = speed *-1
		$PlayerSprites.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()

#Função para quando o personagem morrer
func death():
	self.queue_free()
	pass

func _on_corpo_colisao_body_entered(body):
	pass # Replace with function body.

func set_life(dmg):
	super.set_life(dmg)
	is_taking_dmg = true
	animation.play("Damage")
	await animation.animation_finished
	is_taking_dmg = false
	pass

#Função para avisar que o combate iniciou
func _on_e_area_2d_2_body_entered(body):
	combat = true
	target = body
	pass # Replace with function body.

#Função para avisar que acabou o combate
func _on_e_area_2d_2_body_exited(body):
	combat = false
	pass # Replace with function body.
