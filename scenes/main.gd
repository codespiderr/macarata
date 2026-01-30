extends Node2D
var player_picked = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if DoubleJump.spawn_point == 0:
		$CharacterBody2D.position = Vector2(210,460)
	elif DoubleJump.spawn_point == 1:
		$CharacterBody2D.position = Vector2(-250,550)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_kill_floor_area_entered(area: Area2D) -> void:
	pass
