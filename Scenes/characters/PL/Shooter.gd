extends Character
func is_class(value: String): return value == "" or .is_class(value)
func get_class() -> String: return ""


onready var timer = get_node("Timer")
#onready var timerStartDelay = get_node("TimerStartDelay")
onready var shootTimer = get_node("ShootTimer")
onready var animPlayer = get_node("AnimationPlayer")
onready var animatedSprite = get_node("AnimatedSprite")
onready var ShootArea = get_node("ShootArea")
export var timeDelay : float = 1.5

#### ACCESSORS ####

#### BUILT-IN ####
func _ready() -> void:
	var __ = timer.connect("timeout", self, "_on_timer_timeout")
#	__ = timerStartDelay.connect("timeout", self, "_on_timerDelay_timeout")
	__ = shootTimer.connect("timeout", self, "_on_shootTimer_timeout")
	
	print("Shooter is rdy")
	yield(get_tree().create_timer(timeDelay), "timeout")
	shootTimer.start(4.0)

#### VIRTUALS ####



#### LOGIC ####
func shoot() -> void:
	var bodies = ShootArea.get_overlapping_bodies();
	
	for body in bodies:
		if body is Player:
			print("TOUCHE")
			body.playDead()
			


#### INPUTS ####



#### SIGNAL RESPONSES ####
func _on_timer_timeout() -> void:
	shootTimer.start(4.0)

	
func _on_shootTimer_timeout() -> void:
	yield(get_tree().create_timer(rand_range(0.5, 2.5)), "timeout")
	if animatedSprite.flip_h == true:
		animPlayer.play("shootLeft")
	else:
		animPlayer.play("shootRight")
	print("pew pew")
