extends buttonUp
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

#### ACCESSORS ####

#### BUILT-IN ####



#### VIRTUALS ####



#### LOGIC ####
func activate() -> void:
	$AnimatedSprite.play("Activated")
	if get_node(nodeToActivate) != null and get_node(nodeToActivate).has_method("activateDown"):
		get_node(nodeToActivate).activateDown()
	emit_signal("pressed")
	
	for alien in get_tree().get_nodes_in_group("alien"):
		alien.moveAlien()



#### INPUTS ####



#### SIGNAL RESPONSES ####
