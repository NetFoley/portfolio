extends State
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

#### ACCESSORS ####

#### BUILT-IN ####
func enter_state() -> void:
	if state_machine != null and state_machine.timer != null:
		state_machine.timer.start()
		print("TimerGo")

func update(_delta) -> void:
	if state_machine.player != null and state_machine.caughtPlayer == false and state_machine.player.position.distance_to(state_machine.startPos) < state_machine.chaseDistance:
		state_machine.catchPlayer()
#### VIRTUALS ####



#### LOGIC ####



#### INPUTS ####



#### SIGNAL RESPONSES ####
