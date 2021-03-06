# encoding: utf-8
module ExpedientesHelper
  def link_iniciar_tarea(expediente)
    if expediente.tarea_expediente_actual.finalizado?
      clase = 'btn btn-primary'      
    else
      clase = 'btn'      
      disabled = 'disabled'      
    end
    
    link_to(icon_tag('Inicar', class: 'icon-play icon-white'), 
      iniciar_tarea_path(), class: clase, 
      disabled: disabled, id: 'iniciar_tarea',
      confirm: '¿Está seguro que desea INICIAR esta tarea?')
  end
  
  def link_finalizar_tarea(expediente)
    if expediente.tarea_expediente_actual.finalizado?
      clase = 'btn'      
      disabled = 'disabled'      
    else
      clase = 'btn btn-primary'            
    end
    
    link_to(icon_tag('Finalizar', class: 'icon-ok-sign icon-white'), 
      finalizar_tarea_path(), 
      class: clase, disabled: disabled, 
      id: 'finalizar_tarea', 
      confirm: '¿Está seguro que desea FINALIZAR esta tarea?')      
  end
  
  def link_cancelar_tarea(expediente, vista_tarea)
    tarea_expediente_actual = expediente.tarea_expediente_actual
    tarea_actual_finalizado = tarea_expediente_actual.finalizado?
    if tarea_actual_finalizado
      clase = 'btn'      
      disabled = 'disabled'
      rel = ''
    else
      clase = 'btn btn-primary'
      rel = "#{expediente.id}-#{vista_tarea.id }-#{ tarea_expediente_actual.id }"
    end
    
    link_to(icon_tag('Cancelar', :class => 'icon-stop icon-white'), 
      cancelar_tarea_path(), 
      class: clase, disabled: disabled, 
      rel: rel,
      id: 'cancelar_tarea',
      confirm: '¿Está seguro que desea CANCELAR esta tarea?')      
  end
end
