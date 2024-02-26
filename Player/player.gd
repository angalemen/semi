class_name Player extends CharacterBody2D


var speed := 120
var direccion := 0.0
var jump := 450
const gravity := 15

signal killed

@onready var hp := $PlayerUI/HBoxContainer/hpdata
@onready var anim := $AnimationPlayer
@onready var sprite := $Sprite2D

var initial_position : Vector2

func _ready():
	
	Global.player = self
	quitarVida()
	initial_position = position

func _physics_process(delta):
	direccion = Input.get_axis("ui_left", "ui_right")
	velocity.x = direccion * speed

	sprite.flip_h = direccion > 0 if direccion != 0 else sprite.flip_h

	if is_on_floor():
		if direccion != 0:
			anim.play("walk")
		else:
			anim.play("idle")

		if Input.is_action_just_pressed("ui_accept"):
			velocity.y -= jump
	else:
		anim.play("jump")
		velocity.y += gravity

	move_and_slide()

func _on_area_2d_body_entered(body):
	
	if body == $Player:
		
		position = initial_position
		
func die():
	killed.emit()
	queue_free()
	
func quitarVida():
	hp.text = str(Global.vida)

