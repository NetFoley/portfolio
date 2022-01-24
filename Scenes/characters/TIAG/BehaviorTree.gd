extends StateMachine
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""

export var chaseDistance = 250
var player = null
onready var startPos = owner.position
var wanderRange = 50
onready var timer = $Timer
var caughtPlayer = false

#### ACCESSORS ####
func _ready() -> void:
	var __ = $Timer.connect("timeout", self, "_on_timer_timeout")
	
#### BUILT-IN ####
func catchPlayer() -> void:
	set_state("catching")

#### VIRTUALS ####


#### LOGIC ####
func caught() -> void:
	caughtPlayer = true
	set_state("movingAround")
	player.setCaught()
	print("CAUGHT PLAYER")
	player.connect("player_free", self, "_on_player_free")
	
func freed() -> void:
	caughtPlayer = false
	set_state("waiting")
	


#### INPUTS ####



#### SIGNAL RESPONSES ####
func _on_player_free() -> void:
	set_state("waiting")

func _on_timer_timeout() -> void:
	if get_state_name() != "catching" and get_state_name() != "movingAround":
		set_state("goingTo")
		owner.state_machine.set_state("Move")
		
