extends HBoxContainer

export var player_name : String
export var player_score : int

func _ready():
	$NameLbl.text = player_name + " :"
	$ScoreLbl.text = str(player_score)
