extends KinematicBody2D


# Raycasts
onready var ray_forward : RayCast2D = $Ray/Forward
onready var ray_left : RayCast2D = $Ray/Left
onready var ray_right : RayCast2D = $Ray/Right

# Movement Variables
var move_speed : float = 100
var vel : Vector2


func _ready():
	vel = Vector2.RIGHT

func check_for_wall():
	pass # TODO make the spider turn when colliding with walls

func _process(_delta):
	var __ = move_and_slide(vel*move_speed)
