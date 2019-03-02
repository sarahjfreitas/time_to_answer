class WelcomeController < ApplicationController
  http_basic_authenticate_with name: "oi", password: 'eai'
  def index
  end
end
