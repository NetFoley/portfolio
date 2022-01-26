extends Character
class_name Player

func is_class(value: String): return value == "Player" or .is_class(value)
func get_class() -> String: return "Player"

onready var inputs_node : Node = $Inputs
onready var animPlayer : Node = $AnimationPlayer

signal player_die
signal player_free

var dirLeft : int = 0
var dirRight : int = 0
var dirUp : int = 0
var dirDown : int = 0
var mouseDown : int = 0
var canMove : bool = true
var caught : bool = false
var canBeHit : bool = true
var nbDead : int = 0
var nbCaught : int = 0

#### ACCESSORS ####

#### BUILT-IN ####

func _ready() -> void:
	pass
	
func setCaught() -> void:
	animPlayer.play("caught")
	caught = true
	canMove = false
	nbCaught = nbCaught + 1
	if nbCaught == 3:
		EVENTS.emit_signal("pop", "Achievement ! \nCarni Vore")

func player_free() -> void:
	emit_signal("player_free")
	canMove = true
	caught = false

func revive() -> void:
	animPlayer.play("resurect")
	canMove = true

func playDead() -> void:
	animPlayer.play("dead")
	canMove = false
	emit_signal("player_die")
	nbDead = nbDead + 1
	if nbDead == 5:
		EVENTS.emit_signal("pop", "Achievement ! \nPas ma guerre")

func _physics_process(_delta: float) -> void:
	
	if canMove:
		if !mouseDown:
			var newDir = Vector2(dirRight - dirLeft, dirDown - dirUp)
			set_direction(newDir)
			
		else:
			var pos = Vector2(transform.get_origin().x, transform.get_origin().y)
			var viewSize = get_viewport().get_size()
			var mousePos = pos + get_viewport().get_mouse_position() - viewSize/2
			var dist = abs(abs(mousePos.x-pos.x) + abs(mousePos.y - pos.y))
			set_direction(Vector2(mousePos - pos))
			if dist < 45:
				set_direction(Vector2.ZERO)
	else:
		set_direction(Vector2.ZERO)
		
		if caught and (mouseDown or Vector2(dirRight - dirLeft, dirDown - dirUp) != Vector2.ZERO):
			animPlayer.play("shaking")
	



#### VIRTUALS ####

#### LOGIC ####
func activate() -> void:
	print("wow")

func _input(event: InputEvent) -> void:
	if !event is InputEventKey:
		if !event is InputEventMouseButton:
			return
			
		
	var action_name : String = ""
	
	if event.is_action_pressed(inputs_node.get_input("MoveLeft")):
		action_name = "MoveLeft_Pressed"
	
	elif event.is_action_released(inputs_node.get_input("MoveLeft")):
		action_name = "MoveLeft_Released"
	
	elif event.is_action_pressed(inputs_node.get_input("MoveRight")):
		action_name = "MoveRight_Pressed"
	
	elif event.is_action_released(inputs_node.get_input("MoveRight")):
		action_name = "MoveRight_Released"
	
	elif event.is_action_pressed(inputs_node.get_input("MoveUp")):
		action_name = "MoveUp_Pressed"
	
	elif event.is_action_released(inputs_node.get_input("MoveUp")):
		action_name = "MoveUp_Released"
		
	elif event.is_action_pressed(inputs_node.get_input("MoveDown")):
		action_name = "MoveDown_Pressed"
	
	elif event.is_action_released(inputs_node.get_input("MoveDown")):
		action_name = "MoveDown_Released"
		
	elif event.is_action_pressed(inputs_node.get_input("MoveMouse")):
		action_name = "MoveMouse_Pressed"
	
	elif event.is_action_released(inputs_node.get_input("MoveMouse")):
		action_name = "MoveMouse_Released"
	
	action(action_name)


func action(action_name: String) -> void:
	match(action_name):
		"MoveLeft_Pressed":
			dirLeft = 1
		"MoveLeft_Released":
			dirLeft = 0
		"MoveRight_Pressed":
			dirRight = 1
		"MoveRight_Released":
			dirRight = 0
		"MoveUp_Pressed":
			dirUp = 1
		"MoveUp_Released":
			dirUp = 0
		"MoveDown_Pressed":
			dirDown = 1
		"MoveDown_Released":
			dirDown = 0
		"MoveMouse_Pressed":
			mouseDown = 1
		"MoveMouse_Released":
			mouseDown = 0
		_:
			return
	
func attack() -> void:
	$Weapon.set_visible(true)
	$Weapon/AnimationPlayer.play("attack")

func block() -> void:
	pass
	
#### INPUTS ####

#### SIGNAL RESPONSES ####
