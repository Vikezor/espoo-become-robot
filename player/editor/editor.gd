extends Control


func _on_parts_part_clicked(part):
	var spawned_part: Part = part.duplicate()
	$CenterContainer/Container/Player.add_child(spawned_part)
	while Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		spawned_part.position = get_local_mouse_position()
