extends Area2D

var velocity: Vector2 = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += velocity * delta  # 根据速度更新位置
	if abs(position.y) > 300 or abs(position.x) > 360:
		queue_free()
	
func set_velocity(new_velocity: Vector2):
	velocity = new_velocity


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('body'):
		body.position = Vector2(1700, -7)
		body.dead_count()
		
