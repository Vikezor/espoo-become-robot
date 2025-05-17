class_name PartEntry extends Button

signal clicked(part: Part)

@export var part: Part:
	get:
		return part
	set(value):
		part = value
		text = value.get_part_name()
		# TODO: set the icon


func _on_pressed():
	emit_signal("clicked", part)
