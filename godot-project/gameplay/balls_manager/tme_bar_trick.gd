extends Control


var balls_manager
var random_ball = null


func _ready():
	balls_manager = get_parent()


func set_active(active: bool):
	if $time_bar.is_connected("timeout", self, "_make_random_ball_visible"):
		$time_bar.disconnect("timeout", self, "_make_random_ball_visible")
	
	self.visible = active
	if active:
		random_ball = balls_manager.get_random_ball()
		random_ball.visible = false
		if $time_bar.connect("timeout", self, "_make_random_ball_visible") != OK:
			print("ERROR connecting timeout")
		$time_bar.set_time(5)


func _make_random_ball_visible():
	random_ball.visible = true
