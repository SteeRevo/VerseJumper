extends Control

var dialogue = [" You wanna go somewhere fun?",
" Oh, you dont?",
" That's toooooo bad then idiot."]

onready var dialogue_display
onready var playerNode = get_node("/root/BaseSceneCopy/Player")

signal transition_scene

var dialogue_index = 0
var finished = false

func _ready():
	playerNode.can_move = false
	print(playerNode.can_move)
	load_dialogue()
	print(self.get_path())
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		load_dialogue()
	
func load_dialogue():
	
	if dialogue_index < dialogue.size():
		$RichTextLabel.bbcode_text = dialogue[dialogue_index]
		print(dialogue[dialogue_index])
	else:
		playerNode.can_move = true 
		emit_signal("transition_scene")
		queue_free()
	dialogue_index += 1
