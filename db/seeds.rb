# Generated with RailsBricks
# Initial seed file to use with Devise User Model

# Temporary admin account
u = User.new(
    username: "rodmal",
    email: "rodmal13@gmail.com",
    password: "Warcraft3",
    password_confirmation: "Warcraft3",
    admin: true
)
u.skip_confirmation!
u.save!


