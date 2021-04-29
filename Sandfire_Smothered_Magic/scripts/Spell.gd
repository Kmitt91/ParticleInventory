extends Node2D

var spell_name
var item_quantity

func _ready():
	randomize()
	var rand_val = randi() % 9
	if rand_val == 0:
		spell_name = "Light Scroll"
	elif rand_val == 1:
		spell_name = "Fire Scroll"
	elif rand_val == 2:
		spell_name = "Ice Scroll"
	elif rand_val == 3:
		spell_name = "Lightning Scroll"
	elif rand_val == 4:
		spell_name = "Earth Scroll"
	elif rand_val == 5:
		spell_name = "Blood Scroll"
	elif rand_val == 6:
		spell_name = "Heal Scroll"
	elif rand_val == 7:
		spell_name = "Sandfire Scroll"
	elif rand_val == 8:
		spell_name = "Dark Scroll"
	
	$Sprite.texture = load("res://textures/scroll_symbols/" + spell_name + ".png")
	
func set_item(nm, qt):
	spell_name = nm
	item_quantity = qt
	$TextureRect.texture = load("res://item_icons/" + spell_name + ".png")
	
		
func add_item_quantity(amount_to_add):
	item_quantity += amount_to_add
	$Label.text = String(item_quantity)
	
func decrease_item_quantity(amount_to_remove):
	item_quantity -= amount_to_remove
	$Label.text = String(item_quantity)
	
