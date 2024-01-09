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
## Reference to animation player
@onready var anim := $anim
## Various wall nodes
@onready var walls := [
	owner.get_node("floor"),
	owner.get_node("b_wall"),
	owner.get_node("f_wall"),
	owner.get_node("r_wall"),
	owner.get_node("l_wall"),
]

func _ready() -> void:
	velocity.x = 2.5
	velocity.z = 1.675

func _physics_process(delta : float) -> void:
	# Apply gravity
	velocity.y = max(-20, velocity.y - GRAVITY * delta)
	var store = velocity
	
	# Move and slide
	var result = move_and_collide(velocity * delta)
	
	# Bounce on surfaces
	if result:
		# Bounce
		var normal = result.get_normal()
		var floor = normal.dot(Vector3.UP) == 1
		velocity = store.bounce(normal)
		if floor:
			velocity.y = 10.0
			floor_bounce.play()
			walls[0].get_node("anim").play("hit")
			return
		wall_bounce.play()
		
		# Determine wall
		var r_wall = normal.dot(Vector3.RIGHT) == 1
		var l_wall = normal.dot(Vector3.LEFT) == 1
		var b_wall = normal.dot(Vector3.BACK) == 1
		var f_wall = normal.dot(Vector3.FORWARD) == 1 
		
		if r_wall || l_wall:
			anim.speed_scale *= -1
		
		if b_wall:
			walls[1].get_node("anim").play("hit")
		elif f_wall:
			walls[2].get_node("anim").play("hit")
		elif l_wall:
			walls[3].get_node("anim").play("hit")
		elif r_wall:
			walls[4].get_node("anim").play("hit")
