extends State
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

#### ACCESSORS ####

#### BUILT-IN ####



#### VIRTUALS ####

func enter_state() -> void:
	print("goiback")
	owner.setDest(owner.behaviorTree.startPos)
	owner.behaviorTree.player.revive()


#### LOGIC ####


#### INPUTS ####



#### SIGNAL RESPONSES ####
