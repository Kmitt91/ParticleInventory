extends Control


func _init():
	#set window to fullscreen 
	#OS.window_fullscreen = true
	pass


func _input(event):
	#if any key is pressed
	if (event is InputEventKey or event is InputEventMouseButton or event is InputEventJoypadButton or event is InputEventScreenTouch) and event.is_pressed():
		
		#quit or change scene
		if event.is_action_pressed("ui_cancel"):
			get_tree().quit()
		else:
			$TransitionScreen.fade_out()
		
	

func _on_TransitionScreen_transitioned():
	get_tree().change_scene("res://scenes/Main.tscn")
