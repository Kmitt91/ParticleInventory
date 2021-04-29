extends Control

#preload different particle effects

const sandfire = preload("res://magic_scenes/Sandfire2D.tscn")

const fire = preload("res://magic_scenes/Fire2D.tscn")
const ice = preload("res://magic_scenes/Ice2D.tscn")
const lightning = preload("res://magic_scenes/Lightning2D.tscn")
const earth = preload("res://magic_scenes/Earth2D.tscn")

const light = preload("res://magic_scenes/Light2D.tscn")
const dark = preload("res://magic_scenes/Dark2D.tscn")

const blood = preload("res://magic_scenes/Blood2D.tscn")
const heal = preload("res://magic_scenes/Heal2D.tscn")




func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	


func _on_Panel_cast_magic(magic):
	
	match magic:
		
		"Light Scroll":
			$particle.add_child(light.instance())
		"Fire Scroll":
			$particle.add_child(fire.instance())
		"Ice Scroll":
			$particle.add_child(ice.instance())
		"Lightning Scroll":
			$particle.add_child(lightning.instance())
		"Earth Scroll":
			$particle.add_child(earth.instance())
		"Blood Scroll":
			$particle.add_child(blood.instance())
		"Heal Scroll":
			$particle.add_child(heal.instance())
		"Sandfire Scroll":
			$particle.add_child(sandfire.instance())
		"Dark Scroll":
			$particle.add_child(dark.instance())
		
	


func _on_Panel_delete_magic():
	if $particle.get_child_count() != 0:
		$particle.get_child(0).queue_free()
	
