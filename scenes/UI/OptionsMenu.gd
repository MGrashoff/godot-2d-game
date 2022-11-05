extends CanvasLayer

signal back_pressed

onready var backButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/BackButton
onready var windowModeButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/WindowModeButton
onready var musicRangeControl = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/MusicVolumeContainer/RangeControl
onready var sfxRangeControl = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/SFXVolumeContainer/RangeControl

var fullscreen = false

func _ready():
	windowModeButton.connect("pressed", self, "on_window_mode_pressed")
	backButton.connect("pressed", self, "on_back_pressed")
	musicRangeControl.connect("percentage_changed", self, "on_music_volume_changed")
	sfxRangeControl.connect("percentage_changed", self, "on_sfx_volume_changed")
	update_display()
	update_initial_volume_settings()
	
func update_display():
	windowModeButton.text = "WINDOWED" if !fullscreen else "FULLSCREEN"
	
func on_window_mode_pressed():
	fullscreen = !fullscreen
	OS.window_fullscreen = fullscreen
	update_display()
	
func on_back_pressed():
	emit_signal("back_pressed")

func update_bus_volume(busName, volumePercent):
	var busIndex = AudioServer.get_bus_index(busName)
	var volumeDb = linear2db(volumePercent)
	AudioServer.set_bus_volume_db(busIndex, volumeDb)
	
func get_bus_volume_percent(busName):
	var busIndex = AudioServer.get_bus_index(busName)
	return db2linear(AudioServer.get_bus_volume_db(busIndex))
	
func update_initial_volume_settings():
	musicRangeControl.set_current_percentage(get_bus_volume_percent("Music"))
	sfxRangeControl.set_current_percentage(get_bus_volume_percent("SFX"))

func on_music_volume_changed(percent):
	update_bus_volume("Music", percent)
	
func on_sfx_volume_changed(percent):
	update_bus_volume("SFX", percent)
	
	
	
	
	
	
