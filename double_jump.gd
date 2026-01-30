extends Node

var double_jump_ability = false
var total_jumps = 1

var gears = 0

var money = 2000
var spawn_point = 0 #used to save checkpoints

func _process(delta: float) -> void:
	if gears == 3:
		total_jumps = 2
