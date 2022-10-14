extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const ACCELERATION = 400
const MAX_SPEED = 200
const FRICTION = 400

var motion = Vector2.ZERO

onready var sprite = $Sprite
onready var anim = $AnimationPlayer

var can_move = true
var last_input = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _physics_process(delta):
	if can_move:
		
		#moves player based on input strength
		var inputVector = Vector2.ZERO
		inputVector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
		
		
		if inputVector.x == -1:
			anim.play("walkLeft")
			last_input = 1
			
		elif inputVector.x == 1:
			anim.play("walkRight")
			last_input = -1
		
	#if inputVector.y == 1 and last_input == 1:
		#	anim.play("walkLeft")
		
	#	elif inputVector.y == 1 and last_input == -1:
	#		anim.play("walkRight")
			
	#	if inputVector.y == -1 and last_input == 1:
	#		anim.play("walkLeft")
		
	#	elif inputVector.y == -1 and last_input == -1:
	#		anim.play("walkRight")
		
		
		
		#moves at rate of acceleration times delta and maxes out at max speed
		if inputVector != Vector2.ZERO:
			motion += inputVector * ACCELERATION * delta
			motion = motion.clamped(MAX_SPEED)
			
		else:
			motion = motion.move_toward(Vector2.ZERO, FRICTION * delta)
			if last_input == 1:
				anim.play("idleLeft")
			if last_input == -1:
				anim.play("idleRight")
		
		
		#performs movement of player

		motion = move_and_slide(motion, Vector2.UP)
