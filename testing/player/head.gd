extends Node3D

@export var sensitivity: float = .3


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _physics_process(delta: float) -> void:
	self.position = Global.player.position + Vector3(0, 1.5, 0) # player + height


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		self.rotation_degrees.y -= event.relative.x * sensitivity
		self.rotation_degrees.x -= event.relative.y * sensitivity
		self.rotation_degrees.x = clamp(self.rotation_degrees.x, -90, 90)
		
