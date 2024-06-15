extends RayCast2D


#:= sets the variable type to whatever is on the right side
var is_casting := false :
	set (value):
		is_casting = value
		
		$BeamStartParticles.emitting = true
		$BeamSparkles.emitting = true
		
		if is_casting:
			appear()
		else:
			disappear()
		
		set_physics_process(is_casting)
	
	get:
		return is_casting


func _ready():
	set_physics_process(false)
	$Line2D.points[1] = Vector2.ZERO

func _unhandled_input(event):
	if event is InputEventMouseButton:
		self.is_casting = event.pressed


func _physics_process(delta):
	var cast_point := target_position
	force_raycast_update()
	
	$BeamCollisionParticles.emitting = is_colliding()
	
	if is_colliding():
		cast_point = to_local(get_collision_point())
		$BeamCollisionParticles.global_rotation = get_collision_normal().angle()
		$BeamCollisionParticles.position = cast_point
		
	$Line2D.points[1] = cast_point
	
	$BeamSparkles.position = cast_point * 0.5
	$BeamSparkles.process_material.emission_box_extents.x = cast_point.length() * 0.5
	
func appear():
	#print("appear")
	var tween = create_tween()
	tween.tween_property($Line2D, "width", 10, 1.0)


	
func disappear():
	#print("disappear")
	$BeamStartParticles.emitting = false
	$BeamCollisionParticles.emitting = false
	$BeamSparkles.emitting = false
			
	var tween = create_tween()
	tween.tween_property($Line2D, "width", 0, 1.0)
	
