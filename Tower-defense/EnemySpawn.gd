extends Node2D

@onready var path = preload("res://path1.tscn")
@onready var path2 = preload ("res://path_2.tscn")
@onready var timer = $Timer

var rng = RandomNumberGenerator.new()
var wave_counter = 0




func _on_timer_timeout():
	var num = rng.randf_range(1, 10)
	if num >= 6:
		var fauxpath = path.instantiate()
		add_child(fauxpath)
	if num < 6:
		var fauxpath = path2.instantiate()
		add_child(fauxpath)
	if wave_counter == 3 && timer.wait_time == 2:
		timer.wait_time = 1.5
		wave_counter = 0
	if wave_counter ==3 && timer.wait_time == 1.5:	
		timer.wait_time = 1
	wave_counter = wave_counter + 1	
	print("wave_counter", wave_counter)		
	print("time", timer.wait_time)		


func _on_start_timer_timeout():
	timer.start()
