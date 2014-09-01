class Container < ActiveRecord::Base
    has_many :container_items

    def add_item(print_model_id, quantity, machine_id, material_id, print_material_id)
       item = self.container_items.find_by_print_model_id_and_machine_id_and_material_id_and_print_material_id(print_model_id, machine_id, material_id, print_material_id)
       if item
         item.quantity+=quantity
         item.save
       else
        item = self.container_items.create(:print_model_id => print_model_id,
                                           :quantity => quantity,
                                           :machine_id => machine_id,
                                           :material_id => material_id,
                                           :print_material_id => print_material_id
        )
       end
            
    end

end

