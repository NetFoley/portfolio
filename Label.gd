extends Label
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

#### ACCESSORS ####
func _ready() -> void:
	var __ = EVENTS.connect("pop", self, "_on_pop")
	
#### BUILT-IN ####
func _on_pop(newtext) -> void:
	print("pop")
	text = newtext
	$AnimationPlayer.play("pop")

#### VIRTUALS ####



#### LOGIC ####



#### INPUTS ####



#### SIGNAL RESPONSES ####
