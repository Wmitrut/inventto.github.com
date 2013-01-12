module AtividadesHelper
  def programadores_option selected
    options_from_collection_for_select(Programador.all, :id, :nome, selected)
  end
end
