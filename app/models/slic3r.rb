class Slic3r
  

  def slice(print_job_position)
    print_job_position.update_attributes :status => PrintJobPosition::Slicing
    print_model = print_job_position.print_job.print_model
    archive = print_model.archive.name
    
    filename = [RAILS_ROOT, "files", print_model.archive_id, print_model.filename].join("/")

    backend = print_job_position.get_backend_path
    config=[RAILS_ROOT, "machine_configs", print_job_position.machine.config_file].join("/")
    
    if print_job_position.print_job.layer_height
      layer_height = print_job_position.print_job.layer_height
    else
      layer_height = print_job_position.machine.default_layer_height
    end
    
    fill_pattern = print_model.fill_pattern
    if fill_pattern == nil
        fill_pattern="honeycomb"
				fill_density=20
    end
    
    outfile = [RAILS_ROOT, "tmp", "gcode", [print_job_position.id.to_s, "gcode"].join(".")].join("/")
    
    cmd = [backend, 
           "--load", config, 
           filename, 
#           "--duplicate=#{print_job_position.quantity}",
#           "--bed-size=#{print_job_position.machine.build_size_x},#{print_job_position.machine.build_size_y}",
#           "--print-center=#{print_job_position.machine.center_x},#{print_job_position.machine.center_y}",
#           "--layer-height=#{layer_height}",
           "--fill-density=#{print_model.default_infill}",
           "--fill-pattern=#{fill_pattern}",
           "-o", outfile
           ].join(" ")
    system(cmd)
    
    
    print_job_position.update_attributes :status => PrintJobPosition::DoneWithSlicing,  
                                         :print_material_length => get_filament_needed(File.readlines(outfile))
  end

  handle_asynchronously :slice
  
  def get_filament_needed(data)
    total_extrusion = 0.0
    
     data.each_with_index{|l,i| 
        if l.include?("G92 E0")
            extrude = data[i-1].gsub("\n","").split(";")[0].split("E")[1]
            unless extrude == nil
              total_extrusion += extrude.to_f
            end
            
         end 
     }
     return total_extrusion

  end
  
  
end
