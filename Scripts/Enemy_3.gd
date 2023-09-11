extends Enemy

func _ready():
	body = get_node("PlayerSprites")
	blow = get_node("golpe_colisao/Golpe/Sprite2D")
	timer = get_node("Timer")
	
	char_name = "Luisinho"
	damage = 10
	life = 100
	speed = 100.0
	score = 150
	pass
