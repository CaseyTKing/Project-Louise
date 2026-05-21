extends Area2D

@export var speed: float = 750.0

func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()
