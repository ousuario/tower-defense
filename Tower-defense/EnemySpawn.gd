extends Node2D

@onready var path = preload("res://path1.tscn")
@onready var path2 = preload ("res://path_2.tscn")
@onready var timer = $Timer
@onready var start_timer = $StartTimer


var rng = RandomNumberGenerator.new()
var count



func _on_timer_timeout():
	count = ScoreTracker.coins
	var num = rng.randf_range(1, 10)
	print(count)
	if num >= 6:
		var fauxpath = path.instantiate()
		add_child(fauxpath)
	if num < 6:
		var fauxpath = path2.instantiate()
		add_child(fauxpath)
	if count >= 5 && count < 8  :
		timer.wait_time = 1
	if count >= 8:
		timer.wait_time = 0.5		
	timer.start()
	
	#print("wave_counter", wave_counter)		
	#print("time", timer.wait_time)		

