extends StaticBody2D

onready var directions : Array = [
	0,
	PI,
	PI + (PI/2),
	PI * 2
]
var used = false

func _ready():
	var rng : RandomNumberGenerator = RandomNumberGenerator.new()
	rng.randomize()
	rotate(directions[rng.randi_range(0,3)])

func _on_Button_pressed():
	if not used:
		rotate(deg2rad(90))
