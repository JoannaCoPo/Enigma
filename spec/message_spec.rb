require 'rspec'
require './lib/message'


RSpec.describe Message do
  it 'exists' do
    message = Message.new("Hello World")
    expect(message).to be_an_instance_of(Message)
  end

  it 'has attributes' do
    message = Message.new("Hello World")
    expect(message.unencrypted_message).to eq("Hello World")
  end
end
