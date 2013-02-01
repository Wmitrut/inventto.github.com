class UsersController < ApplicationController
  begin  before_filter :verifica_usuario
    def verifica_usuario
      if id = session[:user_id]
        user = User.find id
#        if user.developer
          return
#        end
      end
      flash[:error] = 'Acesso nao permitido!'
      redirect_to :root
    end
  end

  active_scaffold :user do |conf|
    conf.columns.exclude :uid, :provider, :atividades
    conf.list.columns.exclude :uid, :provider
    conf.columns[:projetos].form_ui = :select
  end
end
