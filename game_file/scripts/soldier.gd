extends Area2D
@export var speed : float 
var normal : bool = false
var die = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".scale.x = -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed * delta 
	if position.x < 1230  and position.y < 300:
		queue_free()
	if speed != 0: 
		normal = true


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group('ball'):
		area.queue_free()
		die = true
		speed = 0
		$soldierAnimation.play('death')
		await get_tree().create_timer(0.8).timeout
		queue_free()
		

		 # Replace with function body.
func get_speed(given_speed):
	speed = given_speed

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('body') and not die :
		if normal:
			body.killed()
		else:
			body.testkilled()
