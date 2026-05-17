extends Area2D

@onready var prompt: Label = $Label
@onready var sprite: Sprite2D = $Sprite2D

var player_in_range:= false
var picked_up:= false

func _ready() -> void:
	prompt.visible = false

func _process(delta: float) -> void:
	if player_in_range and not picked_up:
		if Input.is_action_just_pressed("interact"):
			pick_up()

func _on_body_entered (body: Node2D) -> void:
	if body.name == "Player":
		player_in_range = true
		prompt.visible = true
		sprite.modulate = Color (1, 1, 0.6)

func _on_body_exited (body: Node2D) -> void:
	if body.name == "Player":
		player_in_range = false
		prompt.visible = false
		sprite.modulate = Color (1, 1, 1)

func pick_up() -> void:
	picked_up = true
	prompt.visible = false
	hide()
	queue_free()
	
