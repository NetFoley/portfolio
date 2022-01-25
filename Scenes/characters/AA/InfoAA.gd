extends InfoBlock

class_name infoAA

func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

onready var seeArea = $seeArea
onready var sprite = $AnimatedSprite
#### ACCESSORS ####

#### BUILT-IN ####
func _ready() -> void:
	var __ = seeArea.connect("body_entered", self, "_on_see_entered")
	__ = seeArea.connect("body_exited", self, "_on_see_exited")

#### VIRTUALS ####



#### LOGIC ####



#### INPUTS ####



#### SIGNAL RESPONSES ####
	
func _on_see_entered(body) -> void:
	if body is Player:
		sprite.flip_h = true
		
func _on_see_exited(body) -> void:
	if body is Player:
		sprite.flip_h = false
