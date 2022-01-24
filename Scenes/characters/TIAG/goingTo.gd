extends State
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""


#### ACCESSORS ####

#### BUILT-IN ####
func enter_state() -> void:
	var wanderRange = state_machine.wanderRange
	var pos = Vector2(state_machine.startPos.x + randi()%wanderRange-wanderRange/2, state_machine.startPos.y + randi()%wanderRange-wanderRange/2)
	while pos == owner.position:
		pos = Vector2(state_machine.startPos.x + randi()%wanderRange-wanderRange/2, state_machine.startPos.y + randi()%wanderRange-wanderRange/2)
	owner.setDest(pos)
	print("Wandering")



#### VIRTUALS ####


#### LOGIC ####



#### INPUTS ####



#### SIGNAL RESPONSES ####
