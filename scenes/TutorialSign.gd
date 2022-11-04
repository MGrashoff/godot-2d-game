extends Node2D

export(String, MULTILINE) var text

func _ready():
	$PanelContainer/MarginContainer/Label.text = text
	$PanelContainer.visible = false
	
	var _connectEntered = $Area2D.connect("area_entered", self, "on_area_entered")
	var _connectExited = $Area2D.connect("area_exited", self, "on_area_exited")
	
func on_area_entered(_area2d):
	$PanelContainer.visible = true
	$Sprite.frame = 1
	
func on_area_exited(_area2d):
	$PanelContainer.visible = false
	$Sprite.frame = 0
