extends Node2D
@export var new_soldier : PackedScene
var timer : float = 0
var edge : float = 2
var generate = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if generate == true:
		timer += delta
		if timer > edge:
			var instan = new_soldier.instantiate()
			instan.position = Vector2(1625, -12)
			instan.get_speed((randf() + 0.5) * 50)
			add_child(instan)
			timer = 0
	if Input.is_action_pressed("quit"):
		get_tree().quit()

		
func stopGenerate():
	generate = false
	
func win():
	pass
