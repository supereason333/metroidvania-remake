extends Node

var player_scene := preload("res://player/player.tscn")
var player_ref:BaseEntity
var last_door_id := -1
var current_scene:Node = null

func _ready() -> void:
	player_ref = player_scene.instantiate()

func change_scene(scene_path:String, door_id:int):
	if player_ref.get_parent():
		player_ref.reparent(self)
		player_ref = get_child(0)
	else:
		add_child(player_ref)
	print(player_ref)
	last_door_id = door_id
	current_scene = get_tree().root.get_child(get_tree().root.get_child_count() - 1)
	call_deferred("_deferred_change_scene", scene_path)

func _deferred_change_scene(scene_path:String):
	current_scene.free()
	current_scene = load(scene_path).instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
	player_ref.reparent(current_scene)

func start_game():
	change_scene("res://testing_scenes/world1.tscn", 0)
