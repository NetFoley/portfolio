extends NPC
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

onready var monsterArea = $Area2D
onready var catchArea = $catchArea

export var wanderRange = 50

#### ACCESSORS ####

#### BUILT-IN ####
func _ready() -> void:
	var __ = monsterArea.connect("body_entered", self, "_on_monsterArea_body_entered")
	__ = catchArea.connect("body_entered", self, "_on_catchArea_body_entered")
	__ = monsterArea.connect("body_exited", self, "_on_monsterArea_body_exited")
	behaviorTree.wanderRange = wanderRange

#### VIRTUALS ####
func arrivedToDest() -> void:
	if behaviorTree.get_state_name() == "goingTo":
		behaviorTree.set_state("waiting")
	if behaviorTree.get_state_name() == "catching":
		behaviorTree.set_state("waiting")
	if behaviorTree.get_state_name() == "movingAround":
		behaviorTree.set_state("waiting")
		behaviorTree.set_state("movingAround")


#### LOGIC ####



#### INPUTS ####



#### SIGNAL RESPONSES ####
func _on_catchArea_body_entered(body) -> void:
	if body is Player:
		behaviorTree.caught()

func _on_monsterArea_body_entered(body) -> void:
	if body is Player:
		behaviorTree.player = body

func _on_monsterArea_body_exited(body) -> void:
	if body is Player:
		behaviorTree.freed()
