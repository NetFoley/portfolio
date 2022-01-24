extends State
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

#### ACCESSORS ####
 
#### BUILT-IN ####



#### VIRTUALS ####
func enter_state() -> void:
	owner.setDest(Vector2(owner.position.x, owner.position.y+70))
	print("RESCUE")


func update(_delta) -> void:
	owner.behaviorTree.player.position = owner.position
	
#### LOGIC ####
	



#### INPUTS ####



#### SIGNAL RESPONSES ####
