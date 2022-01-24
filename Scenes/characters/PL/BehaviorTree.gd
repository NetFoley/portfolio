extends StateMachine
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

var player = null
onready var startPos = owner.position

#### ACCESSORS ####

#### BUILT-IN ####

func updateTarget(body) -> void:
	if body is Player :
		player = body
		print("NEW PLAYER")
		player.connect("player_die", self, "helpPlayer")
		
func removeTarget() -> void:
	player = null

func helpPlayer() -> void:
	if player != null and get_state_name() == "waiting":
		set_state("goingTo")
		print("HELPING")

#### VIRTUALS ####



#### LOGIC ####



#### INPUTS ####



#### SIGNAL RESPONSES ####
