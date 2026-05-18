extends Label

func update_health_ui(player) -> void:
	text = "%d/%d" % [player.health, player.max_health]
