extends Area2D

@onready var character_body_2d: CharacterBody2D = $"../CharacterBody2D"

# Called when the node enters the scene tree for the first time.
var picked = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if picked and Input.is_action_pressed("pick"):
		character_body_2d.candel_decrease()



func _on_body_entered(body: Node2D) -> void:
	picked = true
	

func _on_body_exited(body: Node2D) -> void:
	picked = false
