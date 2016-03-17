class TestController < ApplicationController

  def info
    render text: RUBY_VERSION
  end

end
