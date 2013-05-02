class PersonaFisica < ActiveRecord::Base
  #validaciones
  validates :apellido, :presence => true
  validates :nombre, :presence => true
  validates :documento, :presence => true
  validates :tipo_documento_id, :presence => true
  validates :territorio_id, :presence => true
  validates_uniqueness_of :documento

  belongs_to :tipo_documento, :foreign_key => :tipo_documento_id 
  belongs_to :territorio, :foreign_key => :territorio_id 
  belongs_to :cargo_ente, :foreign_key => :cargo_ente_id 

  
  # CONSTANTE
  TIPO_BUSQUEDA = %w{TODOS NOMBRE APELLIDO DOCUMENTO}
  
  def self.search(form, search = nil, documento = nil, nombre = nil, apellido = nil, direccion = nil, telefono = nil)
  	filtro = self
  	if form == 'avanzado'      

  		filtro = filtro.where('documento = ?', documento.to_s) if documento.present?
  		filtro = filtro.where(' nombre like ?', "%#{nombre}%") if nombre.present?
  		filtro = filtro.where(' apellido like ?', "%#{apellido}%") if apellido.present?
  		filtro = filtro.where(' direccion like ?', "%#{direccion}%") if direccion.present?
  		filtro = filtro.where(' telefono like ?', "%#{telefono}%") if telefono.present?

  	elsif search      
  		filtro = filtro.where(' nombre like ? or apellido like ? or documento like ?', "%#{search}%", "%#{search}%", "%#{search}%")                
  	end
  	filtro
  end

  def nombre_completo
  	"#{self.nombre} #{self.apellido}".strip
  end
  
  def apellido_nombre
  	"#{self.apellido}, #{self.nombre}".strip
  end
end
