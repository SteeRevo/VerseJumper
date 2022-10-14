extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var can_trigger = false

func _process(delta):

	if can_trigger and Input.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://Scenes/BaseScene2.tscn")






func _on_Choice_2_body_entered(body):
	if body.name == "Player":
		can_trigger = true


func _on_Choice_2_body_exited(body):
	if body.name == "Player":
		can_trigger = false
