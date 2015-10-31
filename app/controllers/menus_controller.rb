class MenusController < ApplicationController
  after_action :save_relacion, only: [:tipo, :categoria, :cadena]

  skip_before_action :verify_authenticity_token, :only => [:nse, :edad]
  def estado
  	@estados = Estado.all
  	@puntos = Punto.all.pluck(:id)
  end

  def zona
  	@zonas = Zona.where(:estado_id => params[:estados])
  	@puntos =  Punto.joins(:subzona).joins("INNER JOIN zonas  ON subzonas.zona_id = zonas.id").where("zonas.estado_id in (?)", params[:estados]).pluck(:id)
 
  end

  def subzona
  	@subzonas = Subzona.where(:zona_id => params[:zonas])
    @puntos = Punto.joins(:subzona).where("subzonas.zona_id in (?)" , params[:zonas]).pluck(:id)
  end

  def tipo
    puntos_o = Punto.where(:subzona_id => params[:subzonas])
  	@puntos = puntos_o.pluck(:id)
  	@relacion = puntos_o.select(:relacion_id).distinct.pluck(:relacion_id)
  	tipos_id = Relacion.where(:id => @relacion).select(:tipo_id).distinct.pluck(:tipo_id) 
  	@tipos = Tipo.find(tipos_id)
    session[:subzonas] = params[:subzonas]
  end

  def categoria
  	@relacion = Relacion.where("id in (?) and tipo_id in (?)", session[:relacion], params[:tipos]).pluck(:id)
  	@puntos = Punto.where("subzona_id in (?) and relacion_id in (?)", session[:subzonas], @relacion).pluck(:id)
  	categorias_id  = Relacion.where(:id => @relacion).select(:categoria_id).distinct.pluck(:categoria_id)
  	@categorias = Categorium.find(categorias_id)
   end

   def cadena
   	@relacion = Relacion.where("id in (?) and categoria_id in (?)", session[:relacion], params[:categorias]).pluck(:id)
   	@puntos = Punto.where("subzona_id in (?) and relacion_id in (?)", session[:subzonas], @relacion).pluck(:id)
   	cadenas_id  = Relacion.where(:id => @relacion).select(:cadena_id).distinct.pluck(:cadena_id)
   	@cadenas = Cadena.find(cadenas_id)
   end

  def genero
    @relacion = Relacion.where("id in (?) and cadena_id in (?)", session[:relacion], params[:cadenas]).pluck(:id)
    @puntos = Punto.where("subzona_id in (?) and relacion_id in (?)", session[:subzonas], @relacion).pluck(:id)
    @impactos = Impacto.where(:punto_id => @puntos)
    if @impactos.size == 0
      redirect_to controller: 'menus', action: 'fin', puntos: @puntos
    else
      generos_id = Impacto.where(:punto_id => @puntos).pluck(:genero_id)
      @generos = Genero.find(generos_id)

    end
  end

  def nse 
    @impactos = Impacto.where("punto_id in (?) and genero_id in (?)", params[:puntos], params[:generos])
    @puntos = Punto.where(:id =>@impactos.select(:punto_id).distinct.pluck(:punto_id)).pluck(:id)
    @nses = Nse.find(@impactos.pluck(:nse_id))
  end

  def edad
    @impactos = Impacto.where("punto_id in (?) and nse_id in (?)", params[:puntos], params[:nses])
    @puntos = Punto.where(:id=>@impactos.select(:punto_id).distinct.pluck(:punto_id)).pluck(:id)
    @edades = Edad.find(@impactos.pluck(:edad_id))
  end

  def fin
    @puntos = Punto.where(:id =>params[:puntos])  
  end

  def final_impactos
    @impactos = Impacto.where("punto_id in (?) and edad_id in (?)", params[:puntos], params[:edades])
    @puntos = Punto.where(:id=>@impactos.select(:punto_id).distinct.pluck(:punto_id)).pluck(:id)
  end

  def markers
  	@puntos = Punto.find(params[:puntos])
	@markers = @puntos.map { |r| 

	{:title => r.nombre,
	:lat => r.lat,
	:lng => r.lng, 
	:description => r.direccion} 

	} 

		respond_to do |format|
  		format.html
  		format.json { render :json => @markers }
		end
	end

  private


    def save_relacion
      session[:relacion] = @relacion 
    end
  
end
