extends Personagem

var target
var combat = false
var is_taking_dmg = false
@onready var animation = $AnimationPlayer

func _ready():
	char_name = "Cleitin"
	damage = 20
	life = 100
	speed = 300.0
	timer = get_node("Timer")
	pass

func _physics_process(delta):
	
	if life <= 0:
		death()
		pass
	
	if (timer.is_stopped() == true):
		get_golpe_colisao().get_node("Golpe").disabled = true
	else:
		get_golpe_colisao().get_node("Golpe").disabled = false
	
	#Ativar o timer para não atacar constantemente e reproduzir a animação de ataque
	if Input.is_action_just_pressed("Attack"):
		timer.start()
		combat = true
		is_taking_dmg = false
		animation.play("Attack")
		pass

	#Desativar a animação de ataque quando o ataque acabar
	if Input.is_action_just_released("Attack"):
		combat = false
		is_taking_dmg = false
		pass

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		#Reproduzir a animação de caminhada
		animation.play("Walk")
		
		#Mudar a direção da caixa de colisão e do sprite
		side = direction
		if (side == -1):
			$PlayerSprites.flip_h = true
		else:
			$PlayerSprites.flip_h = false
		get_golpe_colisao().get_node("Golpe").position[0] = side*105
		
		#Mover o personagem
		velocity.x = direction * speed
	else:
		if (!combat and !is_taking_dmg):
			animation.play("IDLE")
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	pass

#Função para quando o personagem morrer
func death():
	get_tree().quit()
	#self.queue_free()
	pass

func set_life(dmg):
	super.set_life(dmg)
	is_taking_dmg = true
	animation.play("Damage")
	await animation.animation_finished
	is_taking_dmg = false
	pass

#Função para atacar
func _on_golpe_colisao_body_entered(body):
	if (body.name != "Player"):
		target = body
		if (target.life - damage <= 0):
			score += body.score
			pass
		body.set_life(damage)
	pass # Replace with function body.
