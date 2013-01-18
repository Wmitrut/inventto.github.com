class AtividadesController < ApplicationController
  def ver
    conditions = {}
    if (not params[:projeto].blank?)
      conditions[:projeto_id] = params[:projeto].to_i
    end
    if (not params[:cliente].blank?)
      conditions["projetos.cliente_id"] = params[:cliente].to_i
    end
    if (params[:Atividade] and not params[:Atividade][:data_inicial].blank? and not params[:Atividade][:data_final].blank?)
      @data_inicial = Date.strptime(params[:Atividade][:data_inicial],'%d/%m/%y')
      @data_final = Date.strptime(params[:Atividade][:data_final],'%d/%m/%y')
      if (@data_inicial <= @data_final)
        conditions[:created_at] = @data_inicial..@data_final+1.day
      end
    end
    @atividades = Atividade.joins(:projeto).where(conditions)
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
  def carregar_projetos
    if not params[:cliente].blank?
      @projetos = Projeto.find_all_by_cliente_id(params[:cliente])
    else
      @projetos = Projeto.all
    end
    render :partial => "projetos"
  end

  def kanban
    @atividades = Atividade.where :created_at => Time.now.beginning_of_week..Time.now.end_of_week
    @semana = @atividades.group_by(&:created_at).keys
    @programadores = Programador.all
  end
end
