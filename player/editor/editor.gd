extends Control


var spawned_part: Part
var clicking := false

func _on_parts_part_clicked(part):
	spawned_part = part.duplicate()
	$CenterContainer/Container/Player.add_child(spawned_part)


func _process(_delta):
	if spawned_part != null:
		spawned_part.position = get_local_mouse_position() - $CenterContainer/Container.position


func _on_gui_input(event):
	if spawned_part != null and event is InputEventMouseButton and not event.pressed:
		spawned_part = null
