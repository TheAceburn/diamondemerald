extends KinematicBody2D
class_name Player

var velocity = Vector2.ZERO
var grav = 32
var speed = 480*1.125
onready var icon = $P1
var rot = 0

func apply_gravity(delta):
	var deltasec = delta * 120
	velocity.y += grav * deltasec

# Called every frame. 'delta' is the elapsed time since the previous frame.
# chat please ignore how shitty this spaghetti code is
func _physics_process(delta):
	var deltasec = delta * 60
	apply_gravity(delta)
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = speed * deltasec
	if is_on_floor() and Input.is_action_pressed("jump"):
		velocity.y = -760*1.4 * deltasec
	if not is_on_floor():
		icon.rotation_degrees += 5 * deltasec
	else:
		if not Input.is_action_pressed("jump"):
			if velocity.y >= -10:
				rot = (round(icon.rotation_degrees/90))*90
			elif velocity.y < 400:
				rot = (round(icon.rotation_degrees/90))*90 - 45
			else:
				rot = (round(icon.rotation_degrees/90))*90 - (45*1.125)
		else:
			rot = (round(icon.rotation_degrees/90))*90
		icon.rotation_degrees += (rot - icon.rotation_degrees) / 3
		
	if is_on_wall() or is_on_ceiling() or position.y >= 1000:
		get_tree().reload_current_scene()
