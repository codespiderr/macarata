extends Node2D
var attack = true
var inside
func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("attack") and attack:
		$Sprite2D/AnimationPlayer.play("swing")
		attack = false
		$Timer.start()
	
	if not attack:
		pass
		
	var overlap =  $Sprite2D/Area2D.get_overlapping_bodies()
	
	for i in overlap:
		if i.is_in_group("enemy"):
			kill(i)
		
		
func _on_timer_timeout() -> void:
	attack = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("kill")
	if body.is_in_group("enemy"):
		print("entered")
		body.inside_attack_range = true
	kill(body)

func kill(body):
	if not attack and body.inside_attack_range:
		body.queue_free()
		pass
		
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		print("fakse")
		body.inside_attack_range = false
