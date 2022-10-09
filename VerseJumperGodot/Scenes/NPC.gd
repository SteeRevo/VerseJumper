extends StaticBody2D


const DIALOGUE = preload("res://Scenes/DialogueBox.tscn")
onready var label = $Label
var can_interact = false
var dialoguebox = null

signal dialogue_created

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("ui_accept") and can_interact == true:
		label.visible = false
		var dialogue = DIALOGUE.instance()
		get_parent().get_node("CanvasLayer").add_child(dialogue)
		can_interact = false
		var dialogue_path = get_node("/root/BaseScene/CanvasLayer/Control/DialogueBox")
		dialogue_path.connect("activate_monster", self, "on_dialogue_done")
		emit_signal("dialogue_created")

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		label.visible = true
		can_interact = true


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		label.visible = false
		can_interact = false

func on_dialogue_done():
	queue_free()
