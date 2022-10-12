extends StaticBody2D


const DIALOGUE = preload("res://Scenes/DialogueBox.tscn")
const DIALOGUE2 = preload("res://Scenes/DialogueBox2.tscn")
onready var label = $Label
var can_interact = false
var dialoguebox = null

signal dialogue_created

var scene_name

func _ready():
	scene_name = get_tree().get_current_scene().get_name()

func _process(delta):
	if scene_name == "BaseScene":
		if Input.is_action_pressed("ui_accept") and can_interact == true:
			label.visible = false
			var dialogue = DIALOGUE.instance()
			get_parent().get_node("CanvasLayer").add_child(dialogue)
			can_interact = false
			var dialogue_path = get_node("/root/BaseScene/CanvasLayer/Control/DialogueBox")
			dialogue_path.connect("activate_monster", self, "on_dialogue_done")
			emit_signal("dialogue_created")
	elif scene_name == "BaseSceneCopy":
		if Input.is_action_pressed("ui_accept") and can_interact == true:
			label.visible = false
			var dialogue2 = DIALOGUE2.instance()
			get_parent().get_node("CanvasLayer").add_child(dialogue2)
			can_interact = false
			var dialogue_path2 = get_node("/root/BaseSceneCopy/CanvasLayer/Control/DialogueBox2")
			dialogue_path2.connect("transition_scene", self, "on_dialogue_done")

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		label.visible = true
		can_interact = true


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		label.visible = false
		can_interact = false

func on_dialogue_done():
	if scene_name == "BaseScene":
		queue_free()
	elif scene_name == "BaseSceneCopy":
		get_tree().change_scene("res://Scenes/BaseScene.tscn")
