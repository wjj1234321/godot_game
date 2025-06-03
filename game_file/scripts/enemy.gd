extends Area2D

@export var SPEED : float = 50

@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
var direction : float = -1

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.x += direction * SPEED * delta
	if ray_cast_right.is_colliding():
		direction = -1
		$AnimatedSprite2D.scale.x = 1
	if ray_cast_left.is_colliding():
		direction = 1
		$AnimatedSprite2D.scale.x = -1




func _on_left_direction_body_entered(body: Node2D) -> void:
	print('entered')


func _on_body_entered(body: Node2D) -> void:
	if body == $"../CharacterBody2D":
		if SPEED < 60:
			body.polluted()
		else: 
			body.polluted2()
		
