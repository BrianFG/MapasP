class Zona < ActiveRecord::Base
	belongs_to :estado
	has_many :subzonas
	accepts_nested_attributes_for :subzonas
end
