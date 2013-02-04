class ClientesController < ApplicationController
  def beginning_of_chain
    if id = session[:user_id]
      if User.find(session[:user_id]).developer
        Cliente.unscoped
      else
        Cliente.do_usuario id
      end
    else
      Cliente.unscoped.where("false")
    end
  end

  begin  before_filter :verifica_usuario
    def verifica_usuario
      if session[:user_id]
        return
      end
      flash[:error] = 'Acesso nao permitido!'
      redirect_to :root
    end
  end

  active_scaffold :cliente do |conf|
  end
end
