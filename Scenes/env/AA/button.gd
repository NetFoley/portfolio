extends KinematicBody2D
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""


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
	
func deactivate() -> void:
	$AnimatedSprite.play("Idle")


#### INPUTS ####



#### SIGNAL RESPONSES ####
func _button_body_entered(body) -> void:
	if body is Player:
		activate()
	
func _button_body_exited(body) -> void:
	if body is Player:
		deactivate()

