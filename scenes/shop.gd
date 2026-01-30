extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_detection_body_entered(body: Node2D) -> void:
	
	get_tree().paused = true
	get_node("ShopMenu/AnimationPlayer").play("animIN")
	print("player entered")

func _on_player_detection_body_exited(body: Node2D) -> void:
		pass
