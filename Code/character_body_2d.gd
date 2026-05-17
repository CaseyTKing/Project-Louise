extends CharacterBody2D

@export var speed: float = 150
var inventory: Array[String] = []

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()

func add_item(item_name: String) -> void:
	inventory.append(item_name)
