extends Node2D

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db	# Database Object
var db_name = "res://DataStore/scoreboard_db.db"	# Path to DB



func commit(player_name, player_score):
	db = SQLite.new()
	db.path = db_name
	db.open_db()
	var tableName = "Score"
	
	var dict : Dictionary = Dictionary()
	dict["PlayerName"] = player_name
	dict["PlayerScore"] = floor(abs(float(player_score)))
	
	db.insert_row(tableName,dict)


func _on_SendBtn_pressed():
	var pname = $PlayerNameInp.text
	var pscore = $PlayerScoreInp.text
	commit(pname,pscore)
