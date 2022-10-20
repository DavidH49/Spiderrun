extends Node


func similar_value(value1,value2,similar_range):
	if abs( value1-value2 ) <= similar_range:
		return true
	return false
