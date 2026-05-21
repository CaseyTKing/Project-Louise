extends CharacterBody2D

@export var speed: float = 150
var inventory: Array[String] = []
@export var max_health: float = 100
var health: int = max_health
@export var animation_tree : AnimationTree
var playback : AnimationNodeStateMachinePlayback
@export var bullet_scene: PackedScene
@onready var muzzle: Marker2D = $Muzzle

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()
	select_animation()
	update_animation_parameters()

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
	
func update_animation_parameters():
	animation_tree["parameters/Walking/blend_position"] = velocity
	
func _ready():
	playback = animation_tree["parameters/playback"]
	
func select_animation():
	if velocity == Vector2.ZERO:
		playback.travel("Idle")
	else:
		playback.travel("Walking")
		
		
