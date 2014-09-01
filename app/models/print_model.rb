class PrintModel < ActiveRecord::Base
  belongs_to :archive
  
  default_scope :order => "archive_id, id"
  
  def get_x_y_dimensions
    if self.x == nil or self.y == nil
      p = IO.popen("./backends/slic3r_git/utils/file_info.pl #{RAILS_ROOT}/files/#{self.archive.id}/#{self.filename}")
      a = p.readlines
      x,y,z = a.last.strip[6..-1].split(" ")
      self.x = x[2..-1].to_f
      self.y = y[2..-1].to_f
      self.z = z[2..-1].to_f
      self.save      
      return self.x, self.y
        
    end
    return self.x,self.y
  end
  
end
