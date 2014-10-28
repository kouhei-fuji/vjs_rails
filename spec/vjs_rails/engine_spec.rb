# encoding: utf-8
require 'rails_helper'

RSpec.describe VjsRails::Engine do

  it 'is subclass of Rails::Engine' do
    expect(VjsRails::Engine.superclass).to be Rails::Engine
  end

end
