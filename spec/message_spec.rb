require 'rspec'
require './lib/message'

RSpec.describe Message do
  it 'exists' do
    message = Message.new("Hello World")
    expect(message).to be_an_instance_of(Message)
  end

  it 'has a string message' do
    message = Message.new("Hello World")
    expect(message.message_to_encrypt).to eq("Hello World")
  end
end
