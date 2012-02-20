class Subproceso < Serieproceso
  # relacion
  belongs_to :proceso, :foreign_key => :serieproceso_id
  belongs_to :cargo, :foreign_key => :cargo_id
  has_many :procedimientos	

  
  # Concatena codigo y nombre, especial para usar en combobox
  def codigo_nombre
    "#{codigo} #{nombre}"
  end
end
