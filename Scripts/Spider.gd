extends KinematicBody2D


onready var ray_forward = $RayForward
onready var ray_left = $RayLeft
onready var ray_right = $RayRight

var move_speed = 100
var vel = Vector2.RIGHT

func _process(_delta):
	move_and_slide(vel*move_speed)
