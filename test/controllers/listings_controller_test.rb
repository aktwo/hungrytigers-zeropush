require 'test_helper'

class ListingsControllerTest < ActionController::TestCase

  test "should save listing from post request" do
    new_listing = {name: "Bob", email:"bob@princeton.edu", subject:"[FreeFood] Tasty Food!", body:"There is a lot of free pizza in Frist Gallery.", latitude: 40.3468512, longitude: -74.6552762, timestamp: "Sat Apr 19 22:38:33 2014"}
    assert_nil Listing.find_by(new_listing)
    post :create, listing: new_listing
    assert Listing.find_by(email: new_listing[:email], subject: new_listing[:subject])
  end

end
