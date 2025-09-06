extends Component
class_name Shooting

@export var raycast: RayCast3D
@export var damage: int = 10
@export var cooldown: float = .5

var is_in_cooldown: bool


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("click"):
		try_shoot()

func try_shoot() -> void:
	if is_in_cooldown: return
	
	var target = raycast.get_collider()
	if not target: return
	
	shoot(target)

func shoot(target) -> void:
	if target.find_child("Health"):
		target.health.take_damage(damage)
	start_cool_down()


func start_cool_down():
	is_in_cooldown = true
	await get_tree().create_timer(cooldown).timeout
	is_in_cooldown = false
