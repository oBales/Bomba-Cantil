extends CharacterBody2D
class_name Personagem

var char_name
var speed
var side
var life
var timer
var damage
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_life(dmg):
	life -= dmg
	pass

func get_corpo_colisao():
	return get_node("corpo_colisao")
	pass

func get_golpe_colisao():
	return get_node("golpe_colisao")
	pass

func _on_golpe_colisao_body_entered(body):
	pass # Replace with function body.


func _on_corpo_colisao_body_entered(body):
	pass # Replace with function body.
