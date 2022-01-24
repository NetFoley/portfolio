extends StateMachine
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

var player : Node2D = null

#### ACCESSORS ####

#### BUILT-IN ####
func _ready() -> void:
	pass

#### VIRTUALS ####
func enter_state() -> void:
	if player == null:
		return 
	owner.setDest(player.position)


#### LOGIC ####


#### INPUTS ####



#### SIGNAL RESPONSES ####
