extends State
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

#### ACCESSORS ####

#### BUILT-IN ####


#### VIRTUALS ####
func update(delta:float) -> void:
	owner.moveToDest(delta)


#### LOGIC ####



#### INPUTS ####



#### SIGNAL RESPONSES ####
