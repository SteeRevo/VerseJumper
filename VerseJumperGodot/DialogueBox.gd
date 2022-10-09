extends Control

var dialogue = ["Hello, wanna see something scary?",
"You should start running as soon as you can.",
"Make sure to take a good look at the monster."]

onready var dialogue_display
onready var playerNode = get_node("/root/BaseScene/Player")
onready var catPhoto = get_node("/root/BaseScene/catPhoto")

signal activate_monster

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
		emit_signal("activate_monster")
		queue_free()
	dialogue_index += 1
