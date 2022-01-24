extends gameObject

class_name InfoBlock
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

onready var area : Area2D = $drawArea

#### ACCESSORS ####

#### BUILT-IN ####
func _ready() -> void:
	var __ = area.connect("body_entered", self, "_on_area2D_body_entered")
	__ = area.connect("body_exited", self, "_on_area2D_body_exited")
	

#### VIRTUALS ####



#### LOGIC ####



#### INPUTS ####



#### SIGNAL RESPONSES ####
func _on_area2D_body_entered(body : Node2D) -> void:
	if body is Player:
		$RichTextLabel.showText()
		
func _on_area2D_body_exited(body : Node2D) -> void:
	if body is Player:
		$RichTextLabel.hideText()
