extends Area2D

@export var bullet_scene : PackedScene
var need_shoot = false
var center_angle : float = 135
var angle_range: float = 90
var fire_speed: float = 50
var time = 0
var health : int = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	time += 1
	if need_shoot and time > 20:
		time = 0
		# 随机生成一个角度（在指定范围内）
		var random_angle = (center_angle + (randf() * angle_range - angle_range / 2) )* (PI / 180.0)

		# 计算发射方向
		var direction = Vector2(cos(random_angle), sin(random_angle))

		# 创建子弹
		var bullet = bullet_scene.instantiate()
		add_child(bullet)

		# 设置子弹的速度（假设子弹有 velocity 属性）
		bullet.set_velocity(direction * fire_speed * (randf() + 1) )

		

func _on_结局开始_body_entered(body: Node2D) -> void:
	need_shoot = true
	get_tree().current_scene.stopGenerate()
	


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group('ball'):
		health -= 1
		area.queue_free()
		if health == 0:
			get_tree().current_scene.win()
			queue_free()
		
		
		
