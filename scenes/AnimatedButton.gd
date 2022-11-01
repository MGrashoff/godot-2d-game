extends Button

func _ready():
	var _connectEntered = connect("mouse_entered", self, "on_mouse_entered")
	var _connectExited = connect("mouse_exited", self, "on_mouse_exited")
	var _connectPressed = connect("pressed", self, "on_pressed")
	
func _process(_delta):
	rect_pivot_offset = rect_min_size / 2
	
func on_mouse_entered():
	$HoverAnimationPlayer.play("hover")
	
func on_mouse_exited():
	$HoverAnimationPlayer.play_backwards("hover")

func on_pressed():
	$ClickAnimationPlayer.play("click")

