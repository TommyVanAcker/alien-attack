extends Control


func set_score_label(score):
	$Panel/ScoreLabel.text = "Score: " + str(score)

func _on_retry_btn_pressed() -> void:
	get_tree().reload_current_scene()
