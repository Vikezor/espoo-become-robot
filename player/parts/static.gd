class_name Static extends Part


var initial_transform: Transform2D


#func set_attachment(node: PhysicsBody2D):
	#$PinJoint2D.node_a = get_path_to(node)


func get_part_name():
	return "Static"


func _process(delta):
	if not freeze:
		transform = initial_transform
	else:
		initial_transform = transform
