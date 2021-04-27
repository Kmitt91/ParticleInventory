extends CanvasLayer

signal transitioned


func _ready():
	fade_in()

func fade_out():
	$AnimationPlayer.play("fade_out")
	
func fade_in():
	$AnimationPlayer.play("fade_in")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_out":
		emit_signal("transitioned")
		$AnimationPlayer.play("fade_in")
		
	
