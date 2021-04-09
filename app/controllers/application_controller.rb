class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action do
    @layout = Layout.new
  end
end
