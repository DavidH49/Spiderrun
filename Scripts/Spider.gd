extends KinematicBody2D


# Raycasts
onready var ray_forward : RayCast2D = $RayForward
onready var ray_left : RayCast2D = $RayLeft
onready var ray_right : RayCast2D = $RayRight

# Movement Variables
var move_speed : float = 100
var vel : Vector2


func _ready():
	vel = Vector2.RIGHT

func _process(_delta):
	move_and_slide(vel*move_speed)
