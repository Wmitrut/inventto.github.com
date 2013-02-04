module AtividadesHelper
  def programadores_option selected
    options_from_collection_for_select(Programador.all, :id, :nome, selected)
  end

  def totalizar_horas atividades
    horas = 0;
    atividades.each do |atividade|
      atividade.horas.each do |hora|
        quantas = hora.quantas
        if hora.quantas == nil
          quantas = 0
        end
        horas = horas + quantas
      end
    end
    return horas;
  end
end
