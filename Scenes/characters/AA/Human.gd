extends alien
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

#### ACCESSORS ####

#### BUILT-IN ####



#### VIRTUALS ####



#### LOGIC ####
func alienDie() -> void:
	$AnimationPlayer.play("hitL")
	dead = true
	
func moveAlien() -> void:
	initAlien()
	setDest(Vector2(position.x-200, position.y))
	state_machine.set_state("Move")



#### INPUTS ####



#### SIGNAL RESPONSES ####
