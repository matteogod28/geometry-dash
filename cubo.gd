extends CharacterBody2D

@export var speed: float = 280.0
@export var jump_velocity: float = -450.0

var gravity = ProjectSettings.get_setting(
    "physics/2d/default_gravity"
)

func _physics_process(delta):
    # Movimiento automático
    velocity.x = speed

    # Gravedad
    if not is_on_floor():
        velocity.y += gravity * delta

    # Saltar
    if Input.is_action_just_pressed("ui_accept"):
        if is_on_floor():
            velocity.y = jump_velocity

    move_and_slide()