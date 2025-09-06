extends CharacterBody3D
class_name Player

@onready var health: Health = $Health

func _enter_tree() -> void:
	Global.player = self


func _physics_process(delta: float) -> void:
	move_and_slide()


func _on_health_took_damage() -> void:
	print(health.health)
