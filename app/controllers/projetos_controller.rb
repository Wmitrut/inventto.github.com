class ProjetosController < ApplicationController
  begin before_filter :verifica_usuario
    def verifica_usuario
      if id = session[:user_id]
        return
      end
      flash[:error] = 'Acesso nao permitido!'
      redirect_to :root
    end
  end
  active_scaffold :projeto do |conf|
    conf.columns = [:nome,:descricao,:valor_hora,:cliente]
    conf.columns.exclude :atividades
    conf.list.columns.exclude :descricao
  end
  def beginning_of_chain
    if session[:user_id]
      if User.find(session[:user_id]).developer
        Projeto.unscoped
      else
        Projeto.do_usuario session[:user_id].to_i
      end
    else
      Projeto.unscoped.where("false")
    end
  end
end
