extends Enemy

func _ready():
	body = get_node("PlayerSprites")
	blow = get_node("golpe_colisao/Golpe/Sprite2D")
	timer = get_node("Timer")
	
	char_name = "Zezinho"
	damage = 3
	life = 85
	speed = 200.0
	score = 80
	pass
