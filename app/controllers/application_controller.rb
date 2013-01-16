class ApplicationController < ActionController::Base
  protect_from_forgery

=begin
protected

  def self.active_scaffold_controller_for(klass)
    return "#{klass}ScaffoldController".constantize rescue super
  end
=end

end
