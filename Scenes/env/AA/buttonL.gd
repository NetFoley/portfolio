extends KinematicBody2D

class_name buttonUp

func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

signal pressed
signal unpressed


export(NodePath) var nodeToActivate 
onready var area = $Area2D
#### ACCESSORS ####

#### BUILT-IN ####

func _ready() -> void:
	var __ = area.connect("body_entered", self, "_button_body_entered")
	__ = area.connect("body_exited", self, "_button_body_exited")


#### VIRTUALS ####



#### LOGIC ####
func activate() -> void:
	$AnimatedSprite.play("Activated")
	if get_node(nodeToActivate) != null and get_node(nodeToActivate).has_method("activateUp"):
		get_node(nodeToActivate).activateUp()
	emit_signal("pressed")
	
	for alien in get_tree().get_nodes_in_group("alien"):
		alien.moveAlien()
	
	
func deactivate() -> void:
	$AnimatedSprite.play("Idle")
	emit_signal("unpressed")


#### INPUTS ####



#### SIGNAL RESPONSES ####
func _button_body_entered(body) -> void:
	if body is Player:
		activate()
	
func _button_body_exited(body) -> void:
	if body is Player:
		deactivate()

