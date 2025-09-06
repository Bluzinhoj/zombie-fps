extends Component
class_name Health

signal empty
signal took_damage

@export var health: int

func take_damage(damage: int) -> void:
	health -= damage
	emit_signal("took_damage")
	if health <= 0:
		emit_signal("empty")

func heal_health(heal_value: int) -> void:
	health += heal_value
