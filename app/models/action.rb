class Action < ApplicationRecord
  belongs_to :fight
  belongs_to :assaillant, :class_name => 'Fighter'
  belongs_to :defender, :class_name => 'Fighter'

end
