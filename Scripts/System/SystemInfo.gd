extends Control


var GPU = str(VisualServer.get_video_adapter_name())
var GPUVendor = str(VisualServer.get_video_adapter_vendor())
var RAMUsage = str(OS.get_static_memory_usage()/0148576)
var PowerState = OS.get_power_state()
var PowerPercent = OS.get_power_percent_left()
var PowerTimeLeft = OS.get_power_seconds_left()


func _ready():
	$Title.text = tr("System Information")
	set_info()
	$Label.text = PowerState + PowerPercent + PowerTimeLeft + GPUVendor + GPU + RAMUsage


func _on_OKButton_pressed():
	Running.OpenApps.remove("System Information")
	self.queue_free()


func set_info():
	power_info()
	gpu_info()
	ram_info()
	
func power_info():
	match PowerState:
		0:
			PowerState = tr("Power State") + ": Unknown \n"
		1:
			PowerState = tr("Power State") + ": Battery \n"
		2:
			PowerState = tr("Power State") + ": No Battery \n"
		3:
			PowerState = tr("Power State") + ": Charging \n"
		4:
			PowerState = tr("Power State") + ": Charged \n"
	
	if PowerPercent == -1:
		PowerPercent = tr("Percent Remaining") + ": 100% \n"
		
	else:
		PowerPercent = tr("Percent Remaining") + ": %s \n" %PowerPercent
	
	PowerTimeLeft = tr("Time Remaining") + ": " + str(PowerTimeLeft/60) + "\n"

func gpu_info():
	GPU = tr("GPU") + ": " + GPU + "\n"
	GPUVendor = tr("GPU Provider") + ": " + GPUVendor + "\n"

func ram_info():
	RAMUsage = tr("RAM") + ": %sMB \n" %RAMUsage
 
