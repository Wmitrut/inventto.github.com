class AtividadesController < ApplicationController
  before_filter :verifica_usuario
  after_filter :apenas_projetos_do_cliente, :if => lambda { not user.developer }
  def ver
    filtrar_atividades params
  end
  def lancar
    if user and not user.developer
      redirect_to :root, :error => 'Acesso nao permitido!'
    end
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
      @projetos = Projeto.where("false")
    end
    render :partial => "projetos"
  end

  def kanban
    filtrar_atividades params
    @semana = @atividades.group_by{|atividade|atividade.created_at.beginning_of_day}.keys
    @programadores = Programador.all
  end
  def filtrar_atividades params
    @atividades = user.atividades
    if (not params[:cliente].blank?)
      @atividades = @atividades.do_cliente params[:cliente]
    end
    if (projeto_id= params[:projeto] || params[:projeto_id]).present?
      @atividades = @atividades.do_projeto projeto_id
    end
    if (params[:Atividade] and not params[:Atividade][:data_inicial].blank? and not params[:Atividade][:data_final].blank?)
      @data_inicial = Date.strptime(params[:Atividade][:data_inicial],'%d/%m/%y')
      @data_final = Date.strptime(params[:Atividade][:data_final],'%d/%m/%y')
    elsif(params[:data_inicial] and params[:data_final])
      @data_inicial = Date.strptime(params[:data_inicial],'%d/%m/%y')
      @data_final = Date.strptime(params[:data_final],'%d/%m/%y')
    else
      @data_inicial = Time.now.beginning_of_week
      @data_final = Time.now.end_of_week
    end
    if (@data_inicial and @data_final and @data_inicial <= @data_final)
      @atividades = @atividades.entre(@data_inicial, @data_final+1.day)
    end
    if (params[:programador_id])
      @atividades = @atividades.do_programador params[:programador_id]
    end

  end
  def detalhes
    @atividades = user.atividades
    @atividades = @atividades.do_projeto params[:projeto_id].to_i
    @atividades = @atividades.do_dia Date.strptime(params[:data],'%d/%m/%Y')

    render :partial => "detalhes"
  end
  def detalhes_kanban
    filtrar_atividades params
    render :partial => "detalhes_kanban"
  end
  def verifica_usuario
    if id = session[:user_id]
      return
    end
    flash[:error] = ACESSO_NEGADO
    redirect_to :root
  end
  def apenas_projetos_do_cliente
    if not user.projetos.find params[:projeto_id]
      redirect_to :root, ACESSO_NEGADO
    end
  end
end
