extends Area2D
class_name SceneDoor

@export var door_id:int
@export var other_scene_path:String
@export var spawnpoint:Marker2D

var used := false

func _ready() -> void:
	body_entered.connect(on_body_entered)
	set_collision_layer_value(1, false)
	set_collision_mask_value(2, true)
	set_collision_mask_value(1, false)

func on_body_entered(body:Node2D):
	if body is Player:
		if used: return
		used = true
		Game.change_scene(other_scene_path, door_id)
