extends Node

@onready var gos = $UILayer/GameOverScreen

var player = null
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("player")
	player.killed.connect(_on_player_killed)
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		Global.vida-=1
		get_tree().reload_current_scene()
	if Global.vida <= 0:
		player.die()

func _on_player_killed():
	gos.visible = true

