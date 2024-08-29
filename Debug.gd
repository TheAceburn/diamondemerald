extends Label

onready var player = get_node('..')

func _process(delta):
	text = "velocity: " + str(player.velocity) +"\nposition: " + str(player.position) + "\ngrav: " + str(player.grav) + "\nspeed: " + str(player.speed) + "\n rotation: " + str(player.icon.rotation_degrees)
