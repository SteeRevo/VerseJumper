extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const ACCELERATION = 400
const MAX_SPEED = 300
const FRICTION = 400

var motion = Vector2.ZERO

onready var sprite = $Sprite

var can_move = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _physics_process(delta):
	if can_move:
		
		#moves player based on input strength
		var inputVector = Vector2.ZERO
		inputVector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
		inputVector.y = Input.get_action_strength("down") - Input.get_action_strength("up")
		print(inputVector)
		
		if inputVector.x == -1 and !Input.is_action_pressed("strafe"):
			sprite.set_flip_h(true)
			
		elif inputVector.x == 1 and !Input.is_action_pressed("strafe"):
			sprite.set_flip_h(false)
		
		
		
		
		#moves at rate of acceleration times delta and maxes out at max speed
		if inputVector != Vector2.ZERO:
			motion += inputVector * ACCELERATION * delta
			motion = motion.clamped(MAX_SPEED)
			
		else:
			motion = motion.move_toward(Vector2.ZERO, FRICTION * delta)
		
		
		#performs movement of player

		motion = move_and_slide(motion, Vector2.UP)
