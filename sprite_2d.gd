extends Sprite2D

func shader_on():
	material.set_shader_parameter("active", true)
	
func shader_off():
	material.set_shader_parameter("active", false)
