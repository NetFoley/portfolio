extends NPC
class_name Drone

func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

onready var searchArea : Area2D = $SearchArea
onready var catchArea : Area2D = $CatchArea

#### ACCESSORS ####

#### BUILT-IN ####
func _ready() -> void:
	var __ = searchArea.connect("body_entered", self, "_on_searchArea_entered")
	__ = searchArea.connect("body_exited", self, "_on_searchArea_leaved")
	__ = catchArea.connect("body_entered", self, "_on_catchArea_entered")
	movement_speed = 50
	max_speed = 50


#### VIRTUALS ####
func arrivedToDest() -> void:
	if behaviorTree.get_state_name() == "rescuing":
		behaviorTree.set_state("goingBack")
	if behaviorTree.get_state_name() == "goingBack":
		behaviorTree.set_state("waiting")



#### LOGIC ####

#### INPUTS ####



#### SIGNAL RESPONSES ####
func _on_searchArea_entered(body) -> void:
	if body is Player:
		behaviorTree.updateTarget(body)
		
func _on_searchArea_leaved(body) -> void:
	if body is Player:
		behaviorTree.removeTarget()

func _on_catchArea_entered(body) -> void:
	if body is Player and behaviorTree.get_state_name() == "goingTo":
		behaviorTree.set_state("rescuing")
		
