require File.join(Dummy::Application.root, 'dummy_mounted_app.rb')

Dummy::Application.routes.draw do
  localized do
    get 'dummy',  :to => 'dummy#dummy'
    get 'show',   :to => 'dummy#show'
  end

  get 'foo', :to => 'dummy#foo'

  root :to => 'dummy#dummy'

  mount DummyMountedApp.new => '/dummy_mounted_app'
end
