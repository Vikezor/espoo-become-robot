class_name PartEntry extends HBoxContainer

signal clicked(part: Part, event: InputEvent)

@export var part: Part:
	get:
		return part
	set(value):
		part = value
		$Label.text = value.get_part_name()
		# TODO: set the icon


func _on_gui_input(event):
	if event is InputEventMouseButton:
		emit_signal("clicked", part, event)
