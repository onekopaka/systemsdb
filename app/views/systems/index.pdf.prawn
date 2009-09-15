pdf.text "List of all known systems", :size => 30, :style => :bold

systems = @systems.map do |system|
	[
		system.Make,
		system.Model,
		system.CPU_Family,
		system.CPU_Clock_Speed,
		system.RAM_Amount_MB,
		system.Hard_Drive_Capacity_GB,
		system.Aquired_Date,
		system.Owner_Full_Name,
		system.Owner_Phone,
		system.Barcode
	]
end

pdf.table systems, :border_style => :grid,
  :row_colors => ["FFFFFF", "DDDDDD"],
  :headers => ["Make", "Model", "CPU Family", "CPU Clock Speed", "RAM Amount in MB", "Hard Drive Capacity in GB", "Acquired Date",
  	"Owner Full Name", "Owner Phone", "Barcode"],
  :column_widths => { 0 => 40, 1 => 75, 2 => 50, 3 => 40, 4 => 50, 5 => 100 }
  