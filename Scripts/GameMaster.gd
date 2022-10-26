extends Node2D


var tile_assets = [
	preload("res://Prefabs/Tiles/iTile.tscn"),
	preload("res://Prefabs/Tiles/lTile.tscn"),
	preload("res://Prefabs/Tiles/xTile.tscn")
]
var start_tile = preload("res://Prefabs/Tiles/startTile.tscn")
var end_tile = preload("res://Prefabs/Tiles/endTile.tscn")

var tile_positions = []


func _ready():
	var rng = RandomNumberGenerator.new()
	
	tile_positions = $Tiles.get_children()
	
	for t in tile_positions:
		rng.randomize()
		var randval = rng.randi_range(0,2)
		
		var tile_instance = tile_assets[randval].instance()
		t.add_child(tile_instance)
	
	
	# Places the start
	rng.randomize()
	var start_instance = start_tile.instance()
	var startpos = tile_positions[rng.randi_range(0,tile_positions.size())]
	for c in startpos.get_children():
		c.queue_free()
	startpos.add_child(start_instance)
	
	# Places the end
	#tile_positions[rng.randi_range(0,tile_positions.size()-1)].add_child(end_tile.instance())
	
	# Places the Spider at the start
	$Spider.position = startpos.position
