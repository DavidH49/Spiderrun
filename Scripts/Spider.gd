extends KinematicBody2D


# Raycasts
onready var forward : RayCast2D = $Ray/Forward
onready var left : RayCast2D = $Ray/Left
onready var right : RayCast2D = $Ray/Right

# Movement Variables
var move_speed : float = 40
var vel : Vector2
var walk : bool = false


func check_for_wall():
	if forward.is_colliding():
		if left.is_colliding():
			rotate(PI/2)
		elif right.is_colliding():
			rotate(-PI/2)

func _physics_process(_delta):
	if Input.is_action_just_pressed("WALK"):
		walk = !walk

	if walk:
		check_for_wall()
		var __ = move_and_slide(vel*move_speed)
