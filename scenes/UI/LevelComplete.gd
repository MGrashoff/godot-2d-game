extends CanvasLayer

func _ready():
	var _connectButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/NextLevelButton.connect("pressed", self, "on_next_button_pressed")
	var _connectRestart = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/RestartButton.connect("pressed", self, "on_restart_pressed")
	
func on_next_button_pressed():
	$"/root/LevelManager".increment_level()

func on_restart_pressed():
	$"/root/LevelManager".restart_level()
