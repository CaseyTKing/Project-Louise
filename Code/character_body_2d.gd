extends CharacterBody2D

@export var speed: float = 150
var inventory: Array[String] = []
@export var max_health: float = 100
var health: int = max_health

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()

func add_item(item_name: String) -> void:
	inventory.append(item_name)

func take_damage(amount: int) -> void:
	health = max(health - amount, 0)
	if health == 0:
		die()

func heal(amount: int) -> void:
	health = min(health + amount, max_health)
	
func die() -> void:
	queue_free()
