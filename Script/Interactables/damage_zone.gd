extends Area2D
@onready var sfx_hurt = $sfx_hurt

@export var current_state: spike_state
enum spike_state {ACTIVE, ANIMATED}

func _process(delta):
	match current_state:
		spike_state.ACTIVE:
			active()
		spike_state.ANIMATED:
			active_animated()

func active():
	$anim.play("Active")
	
func active_animated():
	$anim.play("Active_animated")
	

func _on_body_entered(body):
	if body.name=='Player1' || body.name=='Player2':
		player_data.coin=0
		get_tree().change_scene_to_file("res://Scenes/level2.tscn")
