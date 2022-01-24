extends Character
class_name NPC

func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

var dest : Vector2 = Vector2.ZERO
var arrived : bool = true

onready var behaviorTree : StateMachine = $BehaviorTree

#### ACCESSORS ####

#### BUILT-IN ####
func moveToDest(delta) -> void:
	var dir = global_position.direction_to(dest)
	var dist = global_position.distance_to(dest)	
	
	set_direction(dir)

	if dist <= movement_speed * delta:
		var __ = move_and_collide(dir * dist)
		arrivedToDest()
	else:
		var __ = move_and_collide(dir*delta*movement_speed)
		
func setDest(newDest) -> void:
	if newDest == dest:
		return
	dest = newDest
	arrived = false
	print("new dest")
	print(dest)
		
#### VIRTUALS ####



#### LOGIC ####
func arrivedToDest() -> void:
	if arrived == true:
		return
	print("arrived")
	arrived = true

#### INPUTS ####



#### SIGNAL RESPONSES ####
