extends Area2D


onready var ground = $'..'

# all this does is make the ground move when the player touches the area2d
# so it gives the illusion that the ground is infinite
func _on_Area2D_body_entered(body):
	if body is Player:
		ground.position.x += 256
