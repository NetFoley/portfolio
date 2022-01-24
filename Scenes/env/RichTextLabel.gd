extends RichTextLabel
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

#### ACCESSORS ####

#### BUILT-IN ####
func _ready() -> void:
	percent_visible = 0


#### VIRTUALS ####



#### LOGIC ####
func showText() -> void:
	$AnimationPlayer.play("appear")
	
	
func hideText() -> void:
	$AnimationPlayer.play("disappear")
	
	
func startMatrix() -> void:
	custom_effects[0].updateClean(0)
	custom_effects[0].updateDirty(0.5)
	
	
func stopMatrix() -> void:
	custom_effects[0].updateDirty(0)
	custom_effects[0].updateClean(2)

#### INPUTS ####



#### SIGNAL RESPONSES ####
