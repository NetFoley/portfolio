extends State
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

#### ACCESSORS ####

#### BUILT-IN ####
func enter_state() -> void:
	owner.movement_speed = 25
	if state_machine.player == null:
		return
	var wanderRange = state_machine.wanderRange + 50
	var pos = Vector2(state_machine.startPos.x + randi()%wanderRange, state_machine.startPos.y + randi()%wanderRange)
	owner.setDest(pos)

func update(_delta) -> void:
	owner.behaviorTree.player.position = owner.position
	

#### VIRTUALS ####



#### LOGIC ####



#### INPUTS ####



#### SIGNAL RESPONSES ####
