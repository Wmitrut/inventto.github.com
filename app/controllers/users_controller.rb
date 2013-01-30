class UsersController < ApplicationController
  active_scaffold :user do |conf|
    conf.columns.exclude :uid, :provider
    conf.list.columns.exclude :uid, :provider
  end
end
