require 'rails_helper'

RSpec.describe Link, type: :model do

  it "is valid if it has an original URL and lookup code" do 
    link = Link.new(
      original_url: "http://www.hungyi.com/articles/how-to-cook",
      lookup_code: "12345678"
    )

    expect(link.valid?).to be(true)
  end

  it "is invaild if the URL is not formatted properly" do 
    link = Link.new(
      original_url: "hgfuisdhvrijaga",
      lookup_code: "12345678"
    )

    expect(link.valid?).to be(false)
  end

  it "is invalid if does an original URL and lookup code" do 
    link = Link.new(
      original_url: "http://www.hungyi.com/articles/how-to-cook",
    )

    expect(link.valid?).to be(false)
  end

  it "is invalid if does not have an original URL" do 
    link = Link.new(
      lookup_code: "1234567"
    )

     expect(link.valid?).to be(false)
  end

  it "is valid if the lookup code already exists" do
    link = Link.new(
      original_url: "http://www.hungyi.com/articles/how-to-cook",
      lookup_code: "12345678"
    )
    link.save

    link_2 = Link.new(
      original_url: "http://www.hungyi.com/articles/how-to-bake",
      lookup_code: "12345678"
    )
  expect(link_2.valid?).to be(false)
  end

end
