extends Node2D
class_name Level

var player_scene = preload("res://Scenes/player.tscn")
var door_scene = preload("res://Scenes/Door.tscn")
var ui_scene = preload("res://Scenes/ui.tscn")
var next_lvl

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_door(x, y):
	var door = door_scene.instantiate()
	door.position = Vector2(x, y)
	add_child(door)
	pass

func add_ui():
	var ui = ui_scene.instantiate()
	ui.position = Vector2(0, 0)
	add_child(ui)
	pass

func add_player(x, y):
	var player = player_scene.instantiate()
	player.position = Vector2(x, y)
	add_child(player)
	pass
