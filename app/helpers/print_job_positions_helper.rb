module PrintJobPositionsHelper

  
  def print_status(status)
    case status
    when 0
      "New"
   when 1
      "Slicing"
   when 2
      "Printing"
   when 3
      "Done"
   when 4
      "Failure"
   when 5 
      "Done with Slicing"
   
   end
  end

end
