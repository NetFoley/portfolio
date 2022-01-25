extends PopupPanel
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

#### ACCESSORS ####
func _ready() -> void:
	var __ = EVENTS.connect("pop", self, "_on_pop")
	
#### BUILT-IN ####
func _on_pop(text) -> void:
	print("pop")
	popup()
	if $Label != null:
		$Label.text = text
		$AnimationPlayer.play("pop")

#### VIRTUALS ####



#### LOGIC ####



#### INPUTS ####



#### SIGNAL RESPONSES ####
