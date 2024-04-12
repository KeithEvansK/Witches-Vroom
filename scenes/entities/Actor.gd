class_name Actor extends CharacterBody2D


var speed
var jump_velocity

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") + 2
