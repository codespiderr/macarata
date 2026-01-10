extends CharacterBody2D


const SPEED = 400.0
var JUMP_VELOCITY = -600.0
var jump_held = false
var single_check = 1
var direction = 0

var jump_released = false
var jumps_left = 2

var looking_up = false
var health = 5
func _ready() -> void:
	pass
func _physics_process(delta: float) -> void:
	
	#movement controlls
	if not is_on_floor():
		if velocity.y < 0:#gives accelaration to falling and climbing
			velocity += Vector2(0,2300) * delta
		else:
			velocity += Vector2(0,3200) * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump"): # code to stop jumping when jump is stopped pressing
		jump_held = true
	elif Input.is_action_just_released("jump"):
		jump_held = false
		jump_released = true

		

	if is_on_floor():
		jumps_left = DoubleJump.total_jumps
		jump_released = false
		JUMP_VELOCITY = -700.0
	
	if jump_held and is_on_floor():
		velocity.y = JUMP_VELOCITY
		JUMP_VELOCITY = -650.0
		jumps_left -=1
	elif not is_on_floor() and jump_held and jump_released and jumps_left>0:
		velocity.y = JUMP_VELOCITY
		jumps_left -=1
		jump_released = false
	elif not is_on_floor() and not jump_held and velocity.y<-250:
		velocity.y  = -250

	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	
	if Input.is_action_pressed("left"):
		if direction>-0.99:
			direction-=0.2
		$blade.rotation_degrees = -95
		$blade.position = Vector2(-17,0)
	elif Input.is_action_pressed("right"):
		if direction<1:
			direction+=0.2
		$blade.rotation_degrees = 95
		$blade.position = Vector2(17,0)
	else:
		if direction>0.01 and direction!=0:
			direction-=0.2

		elif direction<-0.01 and direction !=0:
			direction+=0.2

	if Input.is_action_just_pressed("look_up"):
		looking_up = true
	if Input.is_action_just_released("look_up"):
		looking_up = false
	
	if looking_up:
		$blade.position = Vector2(0,-20)
		$blade.rotation_degrees = 15
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if $"../CanvasLayer/Control/TextureRect".size.x == 0:
		get_tree().reload_current_scene()

	move_and_slide()


func _on_gunpickup_player_picked() -> void:
	pass # Replace with function body.


func _on_enemy_setect_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.player_hit()
		health -= 1
		$"../CanvasLayer/Control/TextureRect".size.x-=128
		print($"../CanvasLayer/Control/TextureRect".size.x)
		
