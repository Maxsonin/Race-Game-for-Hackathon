extends Node
var point=0
var Maxscore=0
var save
var speed=80.0
var car_img=load("res://imgs/cars/car3.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	save=ConfigFile.new()
	save.load("res://Global/hiscore.cfg")
	Maxscore=save.get_value("game","hiscore",10)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(int(point)>int(Maxscore)):
		rehiscore()
	pass
func rehiscore():
	save.set_value("game","hiscore",point)
	save.save("res://Global/hiscore.cfg")
	Maxscore=point

