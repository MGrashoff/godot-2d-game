extends Node

export(int) var numberToPlay = 3
export(bool) var enablePitchRandomization = true
export(float) var minPitchScale = 0.9
export(float) var maxPitchScale = 1.1

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

func play():
	var validNotes = []
	for streamPlayer in get_children():
		if (!streamPlayer.playing):
			validNotes.append(streamPlayer)
			
	for i in numberToPlay:
		if (validNotes.size() == 0):
			break
		var index = rng.randi_range(0, validNotes.size() - 1)
		
		if (enablePitchRandomization):
			validNotes[index].pitch_scale = rng.randf_range(minPitchScale, maxPitchScale)
		
		validNotes[index].play()
		validNotes.remove(index)
