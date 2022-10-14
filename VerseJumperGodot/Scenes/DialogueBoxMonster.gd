extends Control

var dialogue = [" You've chosen me.", 
" But I can't let you stay human."]

onready var dialogue_display
onready var playerNode = get_node("/root/BaseScene2Control/Player")


signal go_to_end

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
	else:
		playerNode.can_move = true 
		emit_signal("go_to_end")
		queue_free()
	dialogue_index += 1
