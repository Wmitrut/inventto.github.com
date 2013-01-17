class AtividadesController < ApplicationController
  def ver
    p params
    if (not params[:projeto].blank?)
      @atividades = Atividade.find_all_by_projeto_id params[:projeto].to_i
    elsif (not params[:cliente].blank?)
      @atividades = Atividade.joins("JOIN projetos ON projetos.id=projeto_id JOIN clientes ON clientes.id=projetos.cliente_id").where(:"projetos.cliente_id" => params[:cliente].to_i)
    elsif (not params[:Atividade][:data_inicial].blank? and not params[:Atividade][:data_final].blank?)
      data_inicial = Date.strptime(params[:Atividade][:data_inicial],'%d/%m/%Y')
      data_final = Date.strptime(params[:Atividade][:data_final],'%d/%m/%Y')
      @atividades = Atividade.joins(:projeto).where(:created_at => data_inicial...data_final)
    else
      @atividades = Atividade.all
    end
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
