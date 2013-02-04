# encoding: utf-8
class ApplicationController < ActionController::Base
  before_filter :carregar_todos_projetos
  ACESSO_NEGADO = 'Acesso não permitido!'
  protect_from_forgery

  def user
    @user ||= User.find(session[:user_id])
  end
  helper_method :user

  def cliente
    user.cliente if user
  end
  protected

    def usuario_requerido
      if not user
      redirect_to :root, :error => ACESSO_NEGADO
      end
    end
    def carregar_todos_projetos
      @todos_projetos = Projeto.all
    end
end
