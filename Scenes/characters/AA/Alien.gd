extends NPC

class_name alien

func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

onready var startPos = position
var dead : bool = false
onready var animPlayer = $AnimationPlayer

#### ACCESSORS ####

#### BUILT-IN ####
func _ready() -> void:
	var __ = $hitArea.connect("body_entered", self, "_on_hit_body_entered")

var scaleFactor = 0.2
var nbDeath = 0
var antmanned = false
var bigmanned = false

#### VIRTUALS ####



#### LOGIC ####
func alienDie() -> void:
	animPlayer.play("hit")
	dead = true
	
func initAlien() -> void:
	position = startPos
	animPlayer.play("waiting")
	dead = false
	
func moveAlien() -> void:
	initAlien()
	setDest(Vector2(position.x+200, position.y))
	state_machine.set_state("Move")
	
func activateUp() :
	scale = Vector2(scale.x + scaleFactor, scale.y + scaleFactor)
	if scale.x > 2.2:
		scale = Vector2(2.2, 2.2)
		if !bigmanned:
			EVENTS.emit_signal("pop", "Achievement ! \nTo the moon")
			bigmanned = true
	print("up")
	
	
func activateDown() :
	scale = Vector2(scale.x - scaleFactor, scale.y - scaleFactor)
	if scale.x < 0.2:
		scale = Vector2(0.2,0.2)
		if !antmanned:
			EVENTS.emit_signal("pop", "Achievement ! \nAntman")
			antmanned = true
	print("down")



#### INPUTS ####



#### SIGNAL RESPONSES ####
func _on_hit_body_entered(body) -> void:
	if body.has_method("alienDie") and body != self and !dead:
		body.alienDie()
		nbDeath = nbDeath + 1
		if nbDeath == 5:
			EVENTS.emit_signal("pop", "Achievement ! \nSadisme")
