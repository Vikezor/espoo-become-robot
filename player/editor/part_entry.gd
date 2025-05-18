class_name PartEntry extends Button

signal clicked(part: PhysicsBody2D)

@export var part: PhysicsBody2D:
	get:
		return part
	set(value):
		part = value
		text = value.get_part_name()
		# TODO: set the icon


func _on_pressed():
	emit_signal("clicked", part)
