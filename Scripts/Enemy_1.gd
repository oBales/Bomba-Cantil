extends Enemy

func _ready():
	body = get_node("PlayerSprites")
	blow = get_node("golpe_colisao/Golpe/Sprite2D")
	timer = get_node("Timer")
	
	char_name = "Huguinho"
	damage = 5
	life = 100
	speed = 150.0
	score = 100
	pass
