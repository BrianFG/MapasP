class Subzona < ActiveRecord::Base
	belongs_to :zona
	has_many :puntos
	accepts_nested_attributes_for :puntos
end
