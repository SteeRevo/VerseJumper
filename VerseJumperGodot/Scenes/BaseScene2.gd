extends Node2D
const DIALOGUE = preload("res://Scenes/DialogueBoxMonster.tscn")
const DIALOGUE2 = preload("res://Scenes/DialogueBoxHealed.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var backgroundNormal = $Background2
onready var backgroundMonster = $Background3
onready var backgroundHealed = $Background4

var can_trigger = false

var can_trigger2 = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_trigger == true and Input.is_action_pressed("ui_accept"):
		backgroundNormal.visible = false
		backgroundMonster.visible = true
		can_trigger = false
		var dialogue = DIALOGUE.instance()
		get_node("CanvasLayer").add_child(dialogue)
		var dialogue_path = get_node("/root/BaseScene2Control/CanvasLayer/Control/DialogueBoxMonster")
		dialogue_path.connect("go_to_end", self, "on_end")
	elif can_trigger2 == true and Input.is_action_pressed("ui_accept"):
		backgroundNormal.visible = false
		backgroundHealed.visible = true
		can_trigger = false
		var dialogue2 = DIALOGUE2.instance()
		get_node("CanvasLayer").add_child(dialogue2)
		var dialogue_path2 = get_node("/root/BaseScene2Control/CanvasLayer/Control/DialogueBoxHealed")
		dialogue_path2.connect("go_to_end", self, "on_end")


func _on_Choice_1_body_entered(body):
	if body.name == "Player":
		can_trigger = true


func _on_Choice_1_body_exited(body):
	if body.name == "Player":
		can_trigger = false

func on_end():
	get_tree().change_scene("res://Scenes/End_screen.tscn")


func _on_Choice_2_body_entered(body):
	if body.name == "Player":
		can_trigger2 = true


func _on_Choice_2_body_exited(body):
	if body.name == "Player":
		can_trigger2 = false
