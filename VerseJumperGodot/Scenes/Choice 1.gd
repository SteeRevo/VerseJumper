extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const DIALOGUE = preload("res://Scenes/DialogueBox.tscn")
var can_trigger = false;
onready var hand = $SB_Patchy_Hand
onready var handAnim = $SB_Patchy_Hand/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if can_trigger and Input.is_action_pressed("ui_accept"):
		handAnim.play("Slide")
		can_trigger = false
		var dialogue = DIALOGUE.instance()
		get_parent().get_node("CanvasLayer").add_child(dialogue)
		var dialogue_path = get_node("/root/BaseScene/CanvasLayer/Control/DialogueBox")
		dialogue_path.connect("hand_back", self, "on_dialogue_done")



func _on_Choice_1_body_entered(body):
	if body.name == "Player":
		can_trigger = true


func _on_Choice_1_body_exited(body):
	if body.name == "Player":
		can_trigger = false

func on_dialogue_done():
	handAnim.play("SlideBack")
	


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "SlideBack":
		queue_free()
