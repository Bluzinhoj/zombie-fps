extends Component
class_name Controller

@export var speed: int = 4
@export var jump_velocity: float = 4.5

@export_category("references")
@export var player: Player
@export var head: Node3D

@onready var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta: float) -> void:
	align_with_head()
	apply_gravity(delta)
	handle_movement()
	handle_jump()


func align_with_head() -> void:
	player.rotation.y = head.rotation.y


func apply_gravity(delta: float) -> void:
	player.velocity.y -= gravity * delta


func handle_movement() -> void:
	var direction: Vector2 = Input.get_vector("left", "right", "forward", "backward")
	var target_velocity: Vector3 = player.basis * Vector3(direction.x, 0, direction.y) * speed
	
	player.velocity.x = target_velocity.x
	player.velocity.z = target_velocity.z


func handle_jump() -> void:
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.velocity.y = jump_velocity
