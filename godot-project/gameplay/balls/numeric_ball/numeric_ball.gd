extends Area2D


signal numeric_ball_selected

var value = null
var expected_value = null


func set_value(new_value: int, new_expected_value: int):
	value = new_value
	expected_value = new_expected_value
	$sprite/label.bbcode_text = "[center]" + str(value) + "[/center]"


func _unhandled_input(event):
	if (event is InputEventMouseButton && event.pressed and Vector2.ZERO.distance_to(to_local(event.position)) <= Vector2.ZERO.distance_to($border_position.position)):
		if value == expected_value:
			$animation_player.play("right_selection")
			$right_ball_selected.play()
		else:
			$animation_player.play("wrong_selection")
			$wrong_ball_selected.play()
		$selection_timeout.start(1.0)
		get_tree().set_input_as_handled()


func move():
	$ball_movement.activate()

func blink():
	$ball_blinking.activate(self, $animation_player)

func attenuate():
	scale = Vector2(0.75, 0.75)
	$sprite.modulate = Color.orange

func highlight():
	scale = Vector2(1.50, 1.50)
	$sprite.modulate = Color.green


func _on_selection_timeout_timeout():
	emit_signal("numeric_ball_selected", self)
