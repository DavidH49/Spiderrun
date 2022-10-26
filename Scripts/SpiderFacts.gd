extends Control


func _ready():
	var facts : Array = Globals.spider_facts
	var f : String = ""
	
	var rng : RandomNumberGenerator = RandomNumberGenerator.new()
	rng.randomize()
	f = facts[ rng.randi_range(0,facts.size()-1) ]
	
	$FactLbl.text = f
