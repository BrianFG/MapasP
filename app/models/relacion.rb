class Relacion < ActiveRecord::Base
	belongs_to :tipo
	belongs_to :categoria
	belongs_to :cadena
end
