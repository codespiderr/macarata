extends CharacterBody2D
var velocity_switch = true
@export var speed = 100
var inside_attack_range

func _ready() -> void:
	velocity.x = speed
	velocity.y = 400
func _physics_process(delta: float) -> void:
	if $RayCast2D_left.is_colliding():
		pass
	else:
		velocity_switch = false
	
	if $RayCast2D2_right.is_colliding():
		pass
	else:
		velocity_switch = true
		
	if velocity_switch:
		velocity.x = speed*delta
	else:
		velocity.x = -speed*delta
		
	move_and_slide()
	
func player_hit():
	print("player has been hit")
