extends CenterContainer

var main


func display(main, selected_value, expected_value):
	get_tree().paused = true
	visible = true
	self.main = main
	if main.is_victory():
		$panel/margin_container/vbox_container/title.text = "¡VICTORIA!"
		$panel/margin_container/vbox_container/body.text = "¡Gracias por jugar!"
	else:
		$panel/margin_container/vbox_container/title.text = "Game over"
		$panel/margin_container/vbox_container/body.text = "Has seleccionado el {selected_value} pero tocaba el {expected_value}\n".format({
			"selected_value": selected_value,
			"expected_value": expected_value
		})


func _on_restart_button_pressed():
	get_tree().paused = false
	visible = false
	main.set_level(0)