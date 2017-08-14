require 'rails_helper'

describe Contact do
  it "is valid with name, email and content" do
    contact = Contact.new(
      name: 'iwakawa',
      email: 'ruji1978@gmail.com',
      content: 'テスト'
    )
    expect(contact).to be_valid
  end

  it "is invalid without name" do
    contact = Contact.new(
      email: 'ruji1978@gmail.com',
      content: 'テスト'
    )
    expect(contact).not_to be_valid
  end

  it "is invalid without email" do
    contact = Contact.new(
      name: 'iwakawa',
      content: 'テスト'
    )
    expect(contact).not_to be_valid
  end

  it "is invalid without content" do
    contact = Contact.new(
      name: 'iwakawa',
      email: 'ruji1978@gmail.com'
    )
    expect(contact).not_to be_valid
  end

  it "has error messages when each attribute is empty" do
    contact = Contact.new
    contact.valid?
    expect(contact.errors[:name]).to include("を入力してください")
    expect(contact.errors[:email]).to include("を入力してください")
    expect(contact.errors[:content]).to include("を入力してください")
  end
end
