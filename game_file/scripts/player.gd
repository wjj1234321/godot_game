extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -330.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var 烛台: Area2D = $"../烛台"


@export var ball : PackedScene
@export var candle : int = 0
@export var dead : int = 0
@export var infor_label : Label


var direction = 0
var canAttack = true
var attacking = false
var game_start = 0
var playStep = 0


func _ready() -> void:
	position = Vector2(125,850)
 
func _physics_process(delta: float) -> void:
	if (game_start == 0) and Input.is_action_just_pressed("ui_accept"):
		game_start = 1
		position = Vector2(0, -10)
	
	if game_start == 1:
		game_start = 2
		await get_tree().create_timer(1).timeout
		$plot.play()
		plot1()
		playStep = 1
		
	if not attacking:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("up") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			$jump.play()

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		direction = Input.get_axis("left", "right")
		if $player.scale.x != direction and direction != 0:
			$player.scale.x = direction
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	
		if Input.is_action_pressed("attack") and canAttack:
			velocity = Vector2.ZERO
			attack()
	
	checkPlay()
	
	
	infor_label.text = "Candle: " + str(candle) + "\n" + "Death: " + str(dead)
	move_and_slide()


		
func polluted():
	velocity = Vector2.ZERO
	attacking = true
	$player.play("death")
	$hurt.play()
	dead_count()
	await get_tree().create_timer(1).timeout
	position = Vector2(0,-10)
	attacking = false
	$player.play("Jewish2")
	
func polluted2():
	velocity = Vector2.ZERO
	attacking = true
	$player.play("death")
	$hurt.play()
	dead_count()
	await get_tree().create_timer(1).timeout
	position = Vector2(700,-10)
	attacking = false
	$player.play("Jewish2")
	
func watered():
	velocity = Vector2.ZERO
	attacking = true
	$player.play("death")
	$hurt.play()
	dead_count()
	await get_tree().create_timer(1).timeout
	position = Vector2(355,-10)
	attacking = false
	$player.play("Jewish2")

func killed():
	velocity = Vector2.ZERO
	attacking = true
	$player.play("death")
	$hurt.play()
	dead_count()
	await get_tree().create_timer(1).timeout
	position = Vector2(1190,-10)
	attacking = false
	$player.play("Jewish2")
	
func attack():
	attacking = true
	$player.play("attack")
	await get_tree().create_timer(1).timeout
	var newball = ball.instantiate()
	$plot.play()
	get_tree().current_scene.add_child(newball)
	newball.position = position + Vector2(10,-10)
	$player.play("Jewish2")
	attacking = false


func _on_结局开始_body_entered(body: Node2D) -> void:
	canAttack = true
	
func candel_plus():
	candle += 1
	$candle.play()
	if candle == 8:
		await get_tree().create_timer(1).timeout
		position = Vector2(0,-10)
		
func candel_decrease():
	if candle == 8:
		candle = 0
		$"../烛台/烛台".play()
		if dead > 0:
			$"../CanvasLayer/总结".text = "恭喜！如果你有" + str(dead + 1) + "条命的话" + "\n" + "你会成为英雄的！"
		else:
			$"../CanvasLayer/总结".text = "恭喜！你无伤通关，是真正的英雄！"
		$"../CanvasLayer/总结".visible = true
		await get_tree().create_timer(5).timeout
		$"../CanvasLayer/总结".visible = false
		$"../CanvasLayer/谢幕".visible = true
		$"../CanvasLayer/谢幕/署名".visible = true
		
func dead_count():
	dead += 1
	
func testkilled():
	velocity = Vector2.ZERO
	attacking = true
	$player.play("death")
	$hurt.play()
	dead_count()
	await get_tree().create_timer(1).timeout
	position = Vector2(125,850)
	attacking = false
	$player.play("Jewish2")
	
func plot1():
	velocity = Vector2.ZERO
	dead = 0
	candle = 0
	$"../CanvasLayer/剧情介绍1".visible = true
	
func plot2():
	velocity = Vector2.ZERO
	$"../CanvasLayer/剧情介绍2".visible = true
	
func plot3():
	velocity = Vector2.ZERO
	$"../CanvasLayer/剧情介绍3".visible = true
	
func plot4():
	velocity = Vector2.ZERO
	$"../CanvasLayer/剧情介绍4".visible = true
	
func plot5():
	velocity = Vector2.ZERO
	$"../CanvasLayer/剧情介绍5".visible = true
	
func plot6():
	velocity = Vector2.ZERO
	$"../CanvasLayer/谢幕".visible = true

func checkPlay():
	if position.x > 50 and playStep == 1:
		playStep = 2
		stoplay()
		$plot.play()
		plot2()
	if position.x > 1100 and playStep == 2:
		playStep = 3
		stoplay()
		$plot.play()
		plot3()
	if position.x > 1650 and playStep == 3:
		playStep = 4
		stoplay()
		$plot.play()
		plot4()
	if position.x < 50 and playStep == 4:
		playStep = 5
		stoplay()
		$plot.play()
		plot5()
	if Input.is_action_pressed("ui_accept") :
		stoplay()

func stoplay():
		$"../CanvasLayer/剧情介绍1".visible = false
		$"../CanvasLayer/剧情介绍2".visible = false
		$"../CanvasLayer/剧情介绍3".visible = false
		$"../CanvasLayer/剧情介绍4".visible = false
		$"../CanvasLayer/剧情介绍5".visible = false
