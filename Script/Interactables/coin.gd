extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$anim.play("Active")


func _on_body_entered(body):
	if body.name=="Player1"||body.name=="Player2":
		$anim.play("Destroyed")
		player_data.coin+=1
		print("Amount of coins collected: ", player_data.coin)
		await $anim.animation_finished
		queue_free()
	if player_data.coin==2:
		get_tree().change_scene_to_file("res://game_over.tscn")
		player_data.coin = 0
