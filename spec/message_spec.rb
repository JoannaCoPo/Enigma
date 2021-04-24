require 'rspec'
require './lib/message'

RSpec.describe Message do
  it 'exists' do
    message = Message.new
    expect(message).to be_an_instance_of(Message)
  end
end
