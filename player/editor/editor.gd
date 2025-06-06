extends Control


var spawned_part: PhysicsBody2D
var clicking := false
const level_scene = preload("res://node_2d.tscn")
@onready var player = $CenterContainer/Container/Player

func _on_parts_part_clicked(part):
	if spawned_part == null:
		spawned_part = part.duplicate()
		$CenterContainer/Container.add_child(spawned_part)


func _process(_delta):
	if spawned_part != null:
		spawned_part.position = get_local_mouse_position() - $CenterContainer/Container.position
		if Input.is_action_pressed("cancel"):
			$CenterContainer/Container.remove_child(spawned_part)
			spawned_part = null


#func _on_gui_input(event):
	#if spawned_part != null and event is InputEventMouseButton and not event.pressed:
		#spawned_part = null


func _on_go_pressed():
	var level = level_scene.instantiate()
	var spawnpos = level.get_child(0)
	$CenterContainer/Container.remove_child(player)
	level.add_child(player)
	player.position = spawnpos.position
	player.freeze = false
	#for part in player.get_children():
		#if part is PhysicsBody2D:
			#part.freeze = false
	_unfreeze_recursively(player)
	get_tree().root.add_child(level)
	get_tree().root.remove_child(self)


func _on_clicked(node):
	if spawned_part != null:
		spawned_part.add_collision_exception_with(node)
		$CenterContainer/Container.remove_child(spawned_part)
		node.add_child(spawned_part)
		_translate_recursively(spawned_part, node)
		spawned_part.clicked.connect(_on_clicked)
		spawned_part = null

func _unfreeze_recursively(node):
	for part in node.get_children():
		if part is RigidBody2D:#RigidPart:
			part.freeze = false
		_unfreeze_recursively(part)

func _translate_recursively(new: PhysicsBody2D, old):
	if old is PhysicsBody2D:
		new.position -= old.position
		_translate_recursively(new, old.get_parent())
