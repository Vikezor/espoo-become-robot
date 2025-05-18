class_name Spinner extends RigidPart


#func set_attachment(node: PhysicsBody2D):
	#$PinJoint2D.node_a = get_path_to(node)
	
var initial_position: Vector2
#var frames := 0
#var counting := false
var begun := false


func get_part_name():
	return "Spinner"

# WARNING: a hack
#func start_counting():
	#counting = true

func _process(delta):
	if not begun:
		initial_position = position
	else:#if counting and frames < 600:
		position = initial_position
		#frames += 1

func begin():
	angular_velocity = 2 * PI
	begun = true
