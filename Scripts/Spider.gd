extends KinematicBody2D


# Raycasts
onready var forward : RayCast2D = $Ray/Forward
onready var left : RayCast2D = $Ray/Left
onready var right : RayCast2D = $Ray/Right

# Movement Variables
var move_speed : float = 40
var vel : Vector2

func _ready():
	vel = global_transform.basis_xform(Vector2.UP)
	

func check_for_wall():
	if forward.is_colliding():
		if left.is_colliding():
			vel = global_transform.basis_xform(Vector2.RIGHT)
		elif right.is_colliding():
			vel = global_transform.basis_xform(Vector2.LEFT)

func _physics_process(_delta):
	check_for_wall()
	var __ = move_and_slide(vel*move_speed)
