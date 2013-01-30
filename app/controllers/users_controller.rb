class UsersController < ApplicationController
  active_scaffold :user do |conf|
    conf.columns.exclude :uid, :provider, :image
    conf.list.columns.exclude :uid, :provider
  end
end
