class Archive < ActiveRecord::Base
  has_many :print_models
  
  after_create :clone_git_repository
  
  def clone_git_repository
    if self.git_url 
      system("git clone #{self.git_url} #{path}")     
    end
    rescan
  end
  
  def rescan
      if self.git_url 
        system("cd #{path} && git pull")     
      end
            
      stl = Dir.glob "#{path}/**/*.stl"
      stl.each do |file|
                        
        filename = file.gsub(path+"/","")
        res = PrintModel.find_by_archive_id_and_filename(self.id,filename)
        if res == nil
            pm = PrintModel.create(:archive_id => self.id,:filename => filename, :max_x => 1, :max_y => 1)
        end    
          
      end
  end
  
  
  def path
    "#{RAILS_ROOT}/files/#{self.name}"
  end
  

end

