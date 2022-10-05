extends Control

var dialogue = ["Hello, wanna see something scary",
"Are you sure? You shouldn't get closer"]

onready var dialogue_display
onready var playerNode = get_node("/root/BaseScene/Player")
onready var catPhoto = get_node("/root/BaseScene/catPhoto")

var dialogue_index = 0
var finished = false

func _ready():
	playerNode.can_move = false
	print(playerNode.can_move)
	load_dialogue()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		load_dialogue()
	
func load_dialogue():
	
	if dialogue_index < dialogue.size():
		$RichTextLabel.bbcode_text = dialogue[dialogue_index]
		print(dialogue[dialogue_index])
	else:
		playerNode.can_move = true 
		catPhoto.visible = true
		queue_free()
	dialogue_index += 1
