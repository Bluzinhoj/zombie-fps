extends CharacterBody3D

@export var speed: int = 2
@export var damage: int = 5
@export var cooldown: float = 1

var is_in_cooldown: bool

@onready var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var label_3d: Label3D = $Label3D
@onready var health: Health = $Health


func _ready() -> void:
	update_text()


func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	look_at_player()
	move_foward()
	move_and_slide()
	if check_distance() <= 1.5:
		damage_player()


func apply_gravity(delta: float) -> void:
	velocity.y -= gravity * delta


func look_at_player() -> void:
	look_at(Global.player.position, Vector3.UP, true)
	rotation.x = 0


func move_foward() -> void:
	velocity.x = basis.z.x * speed
	velocity.z = basis.z.z * speed


func check_distance() -> float:
	return self.position.distance_to(Global.player.position)


func damage_player() -> void:
	if is_in_cooldown: return
	if Global.player.find_child("Health"):
		Global.player.health.take_damage(damage)
		start_cooldown()


func start_cooldown() -> void:
	is_in_cooldown = true
	await get_tree().create_timer(cooldown).timeout
	is_in_cooldown = false


func update_text() -> void:
	label_3d.text = "health: " + str(health.health)


func _on_health_took_damage() -> void:
	update_text()


func _on_health_empty() -> void:
	queue_free()
