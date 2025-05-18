class_name RigidPart extends RigidBody2D

signal clicked(node: RigidBody2D)


func set_attachment(node: RigidBody2D):
	pass


# this would probably be a hell of a lot more efficient as a const,
# but subclasses can't override those
func get_part_name():
	return "Part"


func _ready():
	input_event.connect(_on_input_event)
	input_pickable = true


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and not event.pressed:
		emit_signal("clicked", self)
