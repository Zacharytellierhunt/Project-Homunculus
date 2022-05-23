extends Node

const Colours = preload("res://src/Actors/Constants.gd").Colours

const killingRules = {
	Colours.NULL_TYPE: {
		Colours.NULL_TYPE: true, 
		Colours.RED_TYPE: true, 
		Colours.YELLOW_TYPE: true, 
		Colours.BLUE_TYPE: true
	},
	Colours.BLUE_TYPE: {
		Colours.NULL_TYPE: true, 
		Colours.RED_TYPE: true
	},
	Colours.RED_TYPE: {
		Colours.NULL_TYPE: true, 
		Colours.YELLOW_TYPE: true
	},
	Colours.YELLOW_TYPE: {
		Colours.NULL_TYPE: true, 
		Colours.BLUE_TYPE: true
	},
}


const openRules = {
	Colours.NULL_TYPE: {
		Colours.NULL_TYPE: false, 
		Colours.RED_TYPE: false, 
		Colours.YELLOW_TYPE: false, 
		Colours.BLUE_TYPE: false
	},
	Colours.BLUE_TYPE: {
		Colours.NULL_TYPE: false, 
		Colours.BLUE_TYPE: true
	},
	Colours.RED_TYPE: {
		Colours.NULL_TYPE: false, 
		Colours.RED_TYPE: true
	},
	Colours.YELLOW_TYPE: {
		Colours.NULL_TYPE: false, 
		Colours.YELLOW_TYPE: true
	},
}
