@abstract class_name PlayerState extends RefCounted

@abstract func enter()

@abstract func exit()

@abstract func _unhandled_input(player: Player, event: InputEvent)

@abstract func _physics_process(player: Player, delta: float)
