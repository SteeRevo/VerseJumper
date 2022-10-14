extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const DIALOGUE = preload("res://Scenes/DialogueBoxCheck1.tscn")
const DIALOGUE2 = preload("res://Scenes/DialogueBoxCheck2.tscn")

onready var label = $Label

var can_interact = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_interact == true and Input.is_action_pressed("ui_accept"):
		if get_name() == "Check 1":
			label.visible = false
			var dialogue = DIALOGUE.instance()
			get_parent().get_node("CanvasLayer").add_child(dialogue)
			can_interact = false
			var dialogue_path = get_node("/root/BaseScene/CanvasLayer/Control/DialogueBoxCheck1")
			
		if get_name() == "Check 2":
			label.visible = false
			var dialogue2 = DIALOGUE2.instance()
			get_parent().get_node("CanvasLayer").add_child(dialogue2)
			can_interact = false
			var dialogue_path = get_node("/root/BaseScene/CanvasLayer/Control/DialogueBoxCheck2")


func _on_Check_1_body_entered(body):
	if body.name == "Player":
		label.visible = true
		can_interact = true


func _on_Check_1_body_exited(body):
	if body.name == "Player":
		label.visible = false
		can_interact = false
		
