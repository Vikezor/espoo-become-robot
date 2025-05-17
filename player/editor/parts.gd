extends VBoxContainer

const entry_scene = preload("res://player/editor/part_entry.tscn")

func _ready():
	for part in ResourceLoader.list_directory("res://player/parts/scenes"):
		var loaded = load("res://player/parts/scenes/" + part).instantiate()
		var entry: PartEntry = entry_scene.instantiate()
		entry.part = loaded
		add_child(entry)
