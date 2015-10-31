class Impacto < ActiveRecord::Base
	belongs_to :punto
	belongs_to :genero
	belongs_to :nse
	belongs_to :edad
end
