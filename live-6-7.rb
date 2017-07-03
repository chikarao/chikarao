class FaceBookUser
  attr_reader :photos, :friends
  attr_accessor :email, :first_name, :last_name
  def initialize(email, password)
    @email = email
    @password = password
    @photos = []
    @friends = []
  end
def full_name
  if @first_name && @last_name
    @first_name + " " + @last_name
  else
    "invalid input"
  end
end
def change_password(old_password, new_password)
  if old_password == @password
    @password = new_password
    true
  else
    false
    "wrong password"
  end
end
  def add_photo(url)
    @photos << url
  end
  def add_friend(friend)
@friends << friend if friend.class == FaceBookUser
  end
  def to_s
output = "#{@first_name} #{last_name} has #{@friends.size} friends"
  end

end

facebook_user = FaceBookUser.new("bob@gmail.com", "secret")
p facebook_user
facebook_user.first_name = "Bob"
facebook_user.last_name = "miller"
p facebook_user
p facebook_user.first_name
p facebook_user.full_name
p facebook_user.change_password("secret", "secret2")
friend_one = FaceBookUser.new("one@email.com", "secret")
friend_two = FaceBookUser.new("two@email.com", "secret")
facebook_user.add_friend(friend_one)
facebook_user.add_friend(friend_two)
p facebook_user.to_s
