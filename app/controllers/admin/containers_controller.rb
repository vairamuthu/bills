class Admin::ContainersController < ApplicationController
before_filter :authenticate_user!

def index
  @containers = Container.all
end

def new
  @container = Container.new  
end

end
