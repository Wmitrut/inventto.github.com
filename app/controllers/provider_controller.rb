class ProviderController < ApplicationController
  def self.included(controller)
    controller.class_eval do
      before_filter :login_required, :only => [:authorize, :revoke]
      before_filter :login_or_oauth_required, :only => [:test_request]
      before_filter :oauth_required, :only => [:invalidate,:capabilities]
      before_filter :verify_oauth_consumer_signature, :only => [:request_token]
      before_filter :verify_oauth_request_token, :only => [:access_token]
      skip_before_filter :verify_authenticity_token, :only=>[:request_token, :access_token, :invalidate, :test_request]
    end
  end
end
