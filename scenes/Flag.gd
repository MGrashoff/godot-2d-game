extends Node2D

signal player_won

func _ready():
	var _connect = $Area2D.connect("area_entered", self, "on_area_entered")
	
func on_area_entered(_area2d):
	print("Won!")
	emit_signal("player_won")

