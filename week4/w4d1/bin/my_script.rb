require 'addressable/uri'
require 'rest-client'

# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users/5.json',
#   query_values: {
#     'some_category[a_key]' => 'another value',
#     'some_category[a_second_key]' => 'yet another value',
#     'some_category[inner_inner_hash][key]' => 'value',
#     'something_else' => 'aaahhhhh'
#   }
# ).to_s
#
# puts RestClient.get(url, {})

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s
  begin
  puts RestClient.post(
    url,
    { user: { username: "HarryPotter" } }
  )
  rescue RestClient::Exception
    puts "failed validations!"
  end
end

def create_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts.json'
  ).to_s
  begin
  puts RestClient.post(
    url,
    { contact: { email: "HarryPotter@hogwarts.edu", name: "hPSON", user_id: 2 } }
  )
  rescue RestClient::Exception
    puts "failed validations!"
  end
end

def update_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/3.json'
  ).to_s
  begin
  puts RestClient.patch(
    url,
    { user: { name: "Gizmo1", email: "changed_email@gizmo.gizmo" } }
  )
  rescue RestClient::Exception
    puts "failed validations!"
  end
end

def delete_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/3.json'
  ).to_s
  begin
  puts RestClient.delete(
    url,
    { user: { name: "Gizmo1", email: "changed_email@gizmo.gizmo" } }
  )
  rescue RestClient::Exception
    puts "failed validations!"
  end
end
create_contact
