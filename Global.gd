extends Node

var player
var vida := 5 :
	set(val):
		vida = val
		if player != null:
			player.quitarVida()
	get:
		return vida
