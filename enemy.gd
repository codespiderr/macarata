extends CharacterBody2D
var movement_speed = 50
@export var target:CharacterBody2D = null
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
var inside_attack_range
var recoil = false

func _ready() -> void:
	call_deferred("seeker_setup")
	
func seeker_setup():
	await get_tree().physics_frame
	if target:
		navigation_agent_2d.target_position = target.global_position
		
		
func _physics_process(delta: float) -> void:
	if target:
		navigation_agent_2d.target_position = target.global_position
	
	if navigation_agent_2d.is_navigation_finished():
		pass
	
	if not recoil:
		var currwnt_position = global_position
		var next_path_position = navigation_agent_2d.get_next_path_position()
		velocity = currwnt_position.direction_to(next_path_position) * movement_speed
	
	move_and_slide()
	pass

func player_hit():
	var currwnt_position = global_position
	var next_path_position = navigation_agent_2d.get_next_path_position()
	$recoil_timer.start()
	recoil = true
	velocity = -1*(currwnt_position.direction_to(next_path_position) * movement_speed*10)
	
func _on_recoil_timer_timeout() -> void:
	recoil = false
