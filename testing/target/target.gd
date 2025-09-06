extends StaticBody3D

@onready var label_3d: Label3D = $Label3D
@onready var health: Health = $Health


func _ready() -> void:
	update_text()


func update_text() -> void:
	label_3d.text = "Health: " + str(health.health)


func _on_health_empty() -> void:
	queue_free()


func _on_health_took_damage() -> void:
	update_text()
