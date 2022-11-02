extends Node2D


var tile_probability : Array = [1,3,15]
var tile_assets : Array = [
	preload("res://Prefabs/Tiles/xTile.tscn"),
	preload("res://Prefabs/Tiles/iTile.tscn"),
	preload("res://Prefabs/Tiles/lTile.tscn")
]
var start_tile : PackedScene = preload("res://Prefabs/Tiles/startTile.tscn")
var end_tile : PackedScene = preload("res://Prefabs/Tiles/endTile.tscn")

var tile_positions : Array = []


func _ready():
	# Makes certain tiles appear more often than others
	var ti : PackedScene
	for _i in range(tile_probability[0]):
		ti = tile_assets[0]
		tile_assets.append(ti)
	for _i in range(tile_probability[1]):
		ti = tile_assets[1]
		tile_assets.append(ti)
	for _i in range(tile_probability[2]):
		ti = tile_assets[2]
		tile_assets.append(ti)
	
	
	var rng : RandomNumberGenerator = RandomNumberGenerator.new()
	
	tile_positions = $Tiles.get_children()
	
	# Places the tiles
	for t in tile_positions:
		rng.randomize()
		var randval = rng.randi_range(0,tile_assets.size()-1)
		
		var tile_instance = tile_assets[randval].instance()
		t.add_child(tile_instance)
	
	
	# Places the start
	rng.randomize()
	var start_instance = start_tile.instance()
	var startpos = tile_positions[rng.randi_range(0,tile_positions.size()-1)]
	for c in startpos.get_children():
		c.queue_free()
	startpos.add_child(start_instance)
	
	# Places the end
	#tile_positions[rng.randi_range(0,tile_positions.size()-1)].add_child(end_tile.instance())
	
	# Places the Spider at the start
	$Spider.position = startpos.position
	$Spider.rotation = start_instance.rotation
