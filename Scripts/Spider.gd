extends KinematicBody2D


# Raycasts
onready var forward : RayCast2D = $Ray/Forward
onready var left : RayCast2D = $Ray/Left
onready var right : RayCast2D = $Ray/Right

# Movement Variables
var move_speed : float = 40
var vel : Vector2 = Vector2.UP

func _ready():
	vel = global_transform.basis_xform(vel)
	

func check_for_wall():
	if forward.is_colliding():
		rotate(PI)
		vel = global_transform.basis_xform(vel)
		
		if left.is_colliding():
			pass
		if right.is_colliding():
			pass

func _process(_delta):
	check_for_wall()
	var __ = move_and_slide(vel*move_speed)
