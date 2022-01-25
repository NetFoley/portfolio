extends Label
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

#### ACCESSORS ####

#### BUILT-IN ####
var __ = connect("mouse_entered", self, "_on_gui_input")


#### VIRTUALS ####



#### LOGIC ####



#### INPUTS ####



#### SIGNAL RESPONSES ####
func _on_gui_input(event) -> void:
	print("link")
	if event.is_action("InputEventMouseButton"):
		OS.shell_open("https://vfonderflick.wixsite.com/work")
		print("link")
