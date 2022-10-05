extends StaticBody2D


const DIALOGUE = preload("res://Scenes/DialogueBox.tscn")
onready var label = $Label
var can_interact = false
var dialoguebox = null

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("ui_accept") and can_interact == true:
		label.visible = false
		var dialogue = DIALOGUE.instance()
		var dialoguebox = get_parent().get_node("CanvasLayer").add_child(dialogue)
		can_interact = false

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		label.visible = true
		can_interact = true


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		label.visible = false
		can_interact = false
