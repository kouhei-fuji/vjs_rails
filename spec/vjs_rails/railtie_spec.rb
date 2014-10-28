# encoding: utf-8
require 'rails_helper'

RSpec.describe VjsRails::Railtie do

  it 'is subclass of Rails::Railtie' do
    expect(VjsRails::Railtie.superclass).to be Rails::Railtie
  end

end
