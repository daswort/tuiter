# == Schema Information
#
# Table name: relacions
#
#  id          :integer         not null, primary key
#  seguidor_id :integer
#  seguido_id  :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Relacion < ActiveRecord::Base
  attr_accessible :seguido_id, :seguidor_id
  
  belongs_to :seguidor, class_name: "Usuario"
  belongs_to :seguido, class_name: "Usuario"
  
  validates :seguidor_id, presence: true
  validates :seguido_id, presence: true
end