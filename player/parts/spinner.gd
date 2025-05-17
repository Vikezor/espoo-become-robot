class_name Spinner extends Part


func set_player(player: Player):
	$PinJoint2D.node_a = player


func get_part_name():
	return "Spinner"
