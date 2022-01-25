extends Panel
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

#### ACCESSORS ####

#### BUILT-IN ####
var __ = connect("gui_input", self, "_on_gui_input")


#### VIRTUALS ####



#### LOGIC ####



#### INPUTS ####



#### SIGNAL RESPONSES ####
func _on_gui_input(event) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("move"):
			var __ = OS.shell_open("https://vfonderflick.wixsite.com/work")
			print("link")
