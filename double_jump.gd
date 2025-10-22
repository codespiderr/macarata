extends Node

var double_jump_ability = false
var total_jumps = 1

var gears = 0

func _process(delta: float) -> void:
	if gears == 3:
		total_jumps = 2
