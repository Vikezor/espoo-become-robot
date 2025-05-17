extends VBoxContainer

const entry_scene = preload("res://player/editor/part_entry.tscn")

signal part_clicked(part: Part, event: InputEvent)

func _ready():
	for part in ResourceLoader.list_directory("res://player/parts/scenes"):
		var loaded: Part = load("res://player/parts/scenes/" + part).instantiate()
		loaded.freeze = true
		var entry: PartEntry = entry_scene.instantiate()
		entry.part = loaded
		add_child(entry)
		entry.clicked.connect(_on_clicked)

func _on_clicked(part: Part, event: InputEvent):
	emit_signal("part_clicked", part, event)
