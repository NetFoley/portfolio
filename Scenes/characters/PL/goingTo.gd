extends State
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

#### ACCESSORS ####

#### BUILT-IN ####
	
func update(_delta) -> void:
	if owner.state_machine != null:
		owner.setDest(owner.behaviorTree.player.position)
		owner.state_machine.set_state("Move")


#### VIRTUALS ####



#### LOGIC ####



#### INPUTS ####



#### SIGNAL RESPONSES ####
