extends Label

var level

# Called when the node enters the scene tree for the first time.
func _ready():
	level = get_parent().get_parent().get_parent().get_parent().get_node(".")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(level.get_node("Personagem").target != null):
		get_parent().get_node("E_Nome").visible = true
		text = level.get_node("Personagem").target.char_name
	else:
		get_parent().get_node("E_Nome").visible = false
	pass
