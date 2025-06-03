extends AnimatableBody2D
@export var distance : float
@export var speed : float = 50
var moved : float = 0
var direction: float = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if moved < distance:
		position.x += speed * direction * delta
		moved += speed * delta
	else:
		moved = 0
		direction *= -1
		position.x += speed * direction * delta
