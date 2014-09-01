class Skeinforge
  

  def slice(print_job_position)
    
    filename = print_job_position.print_job.print_model.filename
    stl_filename = [TmpFiles_folder, [print_job_position.id.to_s, "stl"].join(".")].join("/")
    File.copy([Files_folder, filename].join("/"), stl_filename )
    
    working_dir = [Skeinforge_folder,"skeinforge_application"].join("/")
    exe_dir = [working_dir, "skeinforge_plugins","craft.py"].join("/")
    exe = ["/usr/bin/env python", exe_dir, stl_filename].join(" ")    
    system(exe)
  end

  handle_asynchronously :slice
  
  
end