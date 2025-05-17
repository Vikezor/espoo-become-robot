class_name Part extends RigidBody2D


func set_attachment(node: NodePath):
	pass


# this would probably be a hell of a lot more efficient as a const,
# but subclasses can't override those
func get_part_name():
	return "Part"
