extends Control

@onready var health_label := $HealthLabel
@onready var player := $"../../.."

func _on_player_ready() -> void:
	health_label.text = "HP: " + str(player.health)

func _on_player_damaged(damage: int, from: Node) -> void:
	health_label.text = "HP: " + str(player.health)
