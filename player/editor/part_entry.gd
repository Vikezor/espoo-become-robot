class_name PartEntry extends HBoxContainer

@export var part: Part:
	get:
		return part
	set(value):
		part = value
		$Label.text = value.get_part_name()
		# TODO: set the icon
