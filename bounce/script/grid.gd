# grid.gd
@tool
extends Node2D

'''
Draws Ball grid
'''

const SCREEN_WIDTH = 640
const SCREEN_HEIGHT = 480
const START = 64
const INCREMENT = 32

func _draw() -> void:
	for i in range(9):
		var start = Vector2i(START + INCREMENT * i, START)
		var end = Vector2i(START + INCREMENT * i, SCREEN_HEIGHT - START)
		draw_line(start, end, Color.RED, 1.0)
