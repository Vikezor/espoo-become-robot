class_name Spinner extends RigidPart


#func set_attachment(node: PhysicsBody2D):
	#$PinJoint2D.node_a = get_path_to(node)
	
#var initial_position: Vector2


func get_part_name():
	return "Spinner"


#func _process(delta):
	#if not freeze:
		#position = initial_position
	#else:
		#initial_position = position
