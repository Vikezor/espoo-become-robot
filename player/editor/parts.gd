extends VBoxContainer

const entry_scene = preload("res://player/editor/part_entry.tscn")

signal part_clicked(part: PhysicsBody2D)

func _ready():
	for part in ResourceLoader.list_directory("res://player/parts/scenes"):
		var loaded: PhysicsBody2D = load("res://player/parts/scenes/" + part).instantiate()
		if loaded is RigidBody2D:
			loaded.freeze = true
			#loaded.process_mode = Node.PROCESS_MODE_DISABLED
		var entry: PartEntry = entry_scene.instantiate()
		entry.part = loaded
		add_child(entry)
		entry.clicked.connect(_on_clicked)

func _on_clicked(part: PhysicsBody2D):
	emit_signal("part_clicked", part)
