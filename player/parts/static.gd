class_name Static extends StaticPart

#var initial_transform: Transform2D
#func set_attachment(node: PhysicsBody2D):
	#$PinJoint2D.node_a = get_path_to(node)


func get_part_name():
	return "Static"

#func _process(_delta):
	#if freeze:
		#initial_transform = transform
	#else:
		#transform = initial_transform
