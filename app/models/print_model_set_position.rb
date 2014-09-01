class PrintModelSetPosition < ActiveRecord::Base
    belongs_to :print_model_set
    belongs_to :print_model
end
