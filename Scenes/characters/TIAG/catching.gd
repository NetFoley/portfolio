extends State
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""


#### ACCESSORS ####

#### BUILT-IN ####
func enter_state() -> void:
	print("catching")
	owner.movement_speed = 120


func update(_delta) -> void:
	if owner.state_machine != null and state_machine.player != null:
		owner.setDest(owner.behaviorTree.player.position)
		owner.state_machine.set_state("Move")
		if state_machine.player != null and state_machine.player.position.distance_to(state_machine.startPos) > state_machine.chaseDistance:
			owner.setDest(state_machine.startPos)
			state_machine.set_state("goingTo")


#### VIRTUALS ####



#### LOGIC ####



#### INPUTS ####



#### SIGNAL RESPONSES ####
