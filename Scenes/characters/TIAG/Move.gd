extends State
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

#### ACCESSORS ####

#### BUILT-IN ####

func update(delta:float) -> void:
	owner.moveToDest(delta)
	var is_moving : bool = owner.get_direction() != Vector2.ZERO
	if !is_moving:
		owner.set_state("Idle")


#### VIRTUALS ####



#### LOGIC ####



#### INPUTS ####



#### SIGNAL RESPONSES ####
