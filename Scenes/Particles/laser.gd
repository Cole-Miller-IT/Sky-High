extends RayCast2D


#:= sets the variable type to whatever is on the right side
var is_casting := false :
	set (value):
		is_casting = value
		
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
	
	if is_colliding():
		cast_point = to_local(get_collision_point())
		
	$Line2D.points[1] = cast_point
	
func appear():
	print("appear")
	var tween = create_tween()
	tween.tween_property($Line2D, "width", 30, 1.0)


	
func disappear():
	print("disappear")
	var tween = create_tween()
	tween.tween_property($Line2D, "width", 0, 1.0)
	
