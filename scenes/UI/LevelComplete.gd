extends CanvasLayer

func _ready():
	var _connectButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/Button.connect("pressed", self, "on_next_button_pressed")
	
func on_next_button_pressed():
	$"/root/LevelManager".increment_level()

