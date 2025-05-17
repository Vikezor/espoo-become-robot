extends Control


var spawned_part: Part
var clicking := false
const level_scene = preload("res://test/testlevel.tscn")
@onready var player = $CenterContainer/Container/Player

func _on_parts_part_clicked(part):
	spawned_part = part.duplicate()
	spawned_part.set_attachment(player.get_path())
	player.add_child(spawned_part)


func _process(_delta):
	if spawned_part != null:
		spawned_part.position = get_local_mouse_position() - $CenterContainer/Container.position


func _on_gui_input(event):
	if spawned_part != null and event is InputEventMouseButton and not event.pressed:
		spawned_part = null


func _on_go_pressed():
	var level = level_scene.instantiate()
	var spawnpos = level.get_child(0)
	$CenterContainer/Container.remove_child(player)
	level.add_child(player)
	player.position = spawnpos.position
	player.freeze = false
	get_tree().root.add_child(level)
	get_tree().root.remove_child(self)
