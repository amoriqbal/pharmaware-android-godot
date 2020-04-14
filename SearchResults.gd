extends VBoxContainer
export(PackedScene) var RowContainerScene
export(PackedScene) var CompoSearchRes
#var RowContainer
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var results:Array
#var labels:Array

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	print_debug("****************outside****************")
	if response_code==200:
#		results.push_front(JSON.parse(body.get_string_from_utf8()))
		var bodyParsed=JSON.parse(body.get_string_from_utf8())
		if bodyParsed.error==OK:
			while results.size():
				var r=results.pop_front()
				if typeof(r)==typeof(CompoSearchRes):
					print_debug("****************freeing*******************");
					self.remove_child(r.get_ref())
					r.get_ref().queue_free();
					
			if bodyParsed.result.size():
				for ele in bodyParsed.result:
					results.push_back(weakref(CompoSearchRes.instance()))
					results.back().get_ref().compoStringJSON=JSON.print(ele)
					self.add_child(results.back().get_ref())
					results.back().get_ref().render();
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
#		if bodyParsed.error==OK: 
#			while results.size():
#				print_debug("****************inside****************")
#				var r=results.pop_front()
#				if typeof(r)==typeof(RowContainerScene):
#					print_debug("****************freeing*******************");
#					self.remove_child(r.get_ref())
#					r.get_ref().queue_free();
#			if bodyParsed.result.size():
#				for ele in bodyParsed.result[0].Products:
#					results.push_back(weakref(RowContainerScene.instance()))
#					#results.back().get_ref().text=JSON.print(ele)
#					results.back().get_ref().rowStringJSON = JSON.print(ele)
#					self.add_child(results.back().get_ref())
#
#			#$Label.text=bodyParsed.result[0].name
#			#$HBoxContainer.rowStringJSON = String("i am good")
#			return
