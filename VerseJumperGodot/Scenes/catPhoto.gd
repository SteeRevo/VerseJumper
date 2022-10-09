extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var hitPlayer = true

# Called when the node enters the scene tree for the first time.
func _ready():
	var npc = get_parent().get_node("NPC")
	npc.connect("dialogue_created", self, "connect_to_dialogue")

func connect_to_dialogue():
	var dialogue_path = get_node("/root/BaseScene/CanvasLayer/Control/DialogueBox")
	dialogue_path.connect("activate_monster", self, "monster_time")

func monster_time():
	hitPlayer = false
	
func _process(_delta):
	var player_sight = get_parent().get_node("Player/Sprite").flip_h
	if !hitPlayer and player_sight == false:
		global_position.x += 2


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_parent().get_node("CanvasLayer/ColorRect").visible = true
		get_tree().paused = true
