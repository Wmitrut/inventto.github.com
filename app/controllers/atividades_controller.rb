class AtividadesController < ApplicationController
  def ver
  end
  def lancar
  end
  def create
    @atividade = Atividade.new :descricao => params[:atividade][:descricao], :projeto_id => params[:projeto]
    @atividade.horas.build :programador_id => params[:programador_1], :quantas => params[:atividade][:horas_1]
    @atividade.horas.build :programador_id => params[:programador_2], :quantas => params[:atividade][:horas_2]
    if @atividade.save
      redirect_to '/atividades/ver'
    else
      render 'lancar'
    end
  end
end
