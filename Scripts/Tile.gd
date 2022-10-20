extends StaticBody2D


var used = false

func _on_Button_pressed():
	if not used:
		rotate(deg2rad(90))
