extends Character
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

onready var timer = $Timer
onready var seeArea = $seeArea
#### ACCESSORS ####

#### BUILT-IN ####
func _ready() -> void:
	var __ = seeArea.connect("body_entered", self, "_on_see_entered")
	__ = seeArea.connect("body_exited", self, "_on_see_exited")
	__ = timer.connect("timeout", self, "_on_timeout")
	animated_sprite.playing = false
	timer.start(randf())



#### VIRTUALS ####



#### LOGIC ####



#### INPUTS ####



#### SIGNAL RESPONSES ####
func _on_timeout() -> void:
	$AnimatedSprite.playing = true

func _on_see_entered(body) -> void:
	if body is Player:
		animated_sprite.flip_h = true
		
func _on_see_exited(body) -> void:
	if body is Player:
		animated_sprite.flip_h = false
