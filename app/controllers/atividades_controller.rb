class AtividadesController < ApplicationController
  def ver
    @atividades = Atividade.joins(:projeto).where(filtro params)
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
    @atividades = Atividade.joins(:projeto).where(filtro params)
    @semana = @atividades.group_by{|atividade|atividade.created_at.beginning_of_day}.keys
    @programadores = Programador.all
  end
  def filtro params
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
    else
        @data_inicial = Time.now.beginning_of_week
        @data_final = Time.now.end_of_week
    end
    if (@data_inicial and @data_final and @data_inicial <= @data_final)
      conditions[:created_at] = @data_inicial..@data_final+1.day
    end
    conditions
  end
  def detalhes
    conditions={}
    conditions[:projeto_id] = params[:projeto_id].to_i
    data = Date.strptime(params[:data],'%d/%m/%Y')
    conditions[:created_at] = data..data+1.day
    p conditions

    @atividades_do_dia = Atividade.joins(:projeto).where(conditions)
    p @atividades_do_dia

    render :partial => "detalhes"
  end
end
