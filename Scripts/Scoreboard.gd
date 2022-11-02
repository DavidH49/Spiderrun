extends Control

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
var db	# Database Object
var db_name = "res://DataStore/scoreboard_db.db"	# Path to DB

var scores : Array
onready var sb_entry = preload("res://Prefabs/ScoreboardEntry.tscn")


# Connects to the database
func connect_db():
	db = SQLite.new()
	db.path = db_name
	db.open_db()


# Creates new DB entry for new players
func commit(player_name, player_score):
	connect_db()
	
	var tableName = "Score"
	var dict : Dictionary = Dictionary()
	dict["PlayerName"] = player_name
	dict["PlayerScore"] = abs(int(player_score))
	
	db.insert_row(tableName,dict)
	db.close_db()

func get_scoreboard():
	connect_db()
	scores = db.select_rows( "Score","",["PlayerName","PlayerScore"] )
	db.close_db()



func _on_SendBtn_pressed():
	var pid = $PlayerIDInp.text
	var pscore = $PlayerScoreInp.text
	commit(pid,pscore)

func _on_GetBtn_pressed():
	get_scoreboard()
	
	for c in $ScoresBox.get_children():
		c.queue_free()
	
	for s in scores:
		var sbe = sb_entry.instance()
		sbe.player_name = s["PlayerName"]
		sbe.player_score = str(s["PlayerScore"])
		$ScoresBox.add_child(sbe)
