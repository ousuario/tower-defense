extends Control
@onready var tower = get_node("..")
@onready var main = get_node("../../..")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_upgrade_button_pressed():
	if tower.upgrade1 == false && tower.upgrade2 == false:
		if tower.upgrade_price1 <= main.coins:
			tower.upgrade1 = true	
			main.coins = main.coins - tower.upgrade_price1
		$".".hide()	
		return
	if tower.upgrade1 == true && tower.upgrade2 == false:
		tower.upgrade2 = true
		$".".hide()	
		return
	if tower.upgrade1 == true && tower.upgrade2 == true:
		$".".hide()	


func _on_cencel_button_pressed():
	$".".hide()	
