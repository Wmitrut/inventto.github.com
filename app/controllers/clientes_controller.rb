class ClientesController < ApplicationController
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
