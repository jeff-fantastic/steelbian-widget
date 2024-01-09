# ball.gd
class_name Ball extends CharacterBody3D

'''
Ball demo
'''

const GRAVITY = 9.8

## Reference to floor bounce sfx
@onready var floor_bounce = $sfx/bounce
## Reference to wall bounce sfx
@onready var wall_bounce = $sfx/bounce_wall

func _ready() -> void:
	velocity.x = 3.14
	velocity.z = 2.3

func _physics_process(delta : float) -> void:
	# Apply gravity
	velocity.y = max(-20, velocity.y - GRAVITY * delta)
	var store = velocity
	
	# Move and slide
	var result = move_and_collide(velocity * delta)
	
	# Bounce on surfaces
	if result:
		var normal = result.get_normal()
		var floor = normal.dot(Vector3.UP) == 1
		velocity = store.bounce(normal)
		if floor:
			velocity.y = 8.0
			floor_bounce.play()
			return
		wall_bounce.play()
