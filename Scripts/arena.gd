extends Level

var enemy1_scene = preload("res://Scenes/enemy_1.tscn")
var enemy2_scene = preload("res://Scenes/enemy_2.tscn")
var enemy3_scene = preload("res://Scenes/enemy_3.tscn")

var cont = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	add_player(94, 581)
	add_ui()
	get_node("Spawn/Timer").start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_node("Spawn/Timer").is_stopped()):
		cont += 1
		get_node("Spawn/Timer").start()
		var enemy
		match cont:
			1:
				enemy = enemy1_scene.instantiate()
			2:
				enemy = enemy2_scene.instantiate()
			3:
				enemy = enemy3_scene.instantiate()
				cont = 0
		enemy.position = get_node("Spawn").position
		add_child(enemy)
		pass
	pass
