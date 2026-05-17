extends Control

@onready var list_container: VBoxContainer = $Panel/VBoxContainer

func refresh(items: Array[String]) -> void:
	for child in list_container.get_children():
		child.queue_free()

	for item in items:
		var label := Label.new()
		label.text = item
		list_container.add_child(label)
