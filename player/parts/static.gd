class_name Static extends Part


#func set_attachment(node: PhysicsBody2D):
	#$PinJoint2D.node_a = get_path_to(node)


func get_part_name():
	return "Static"
