class AuthenticateUser
    prepend SimpleCommand

    def initialize(email, password)
        #this is where parameters are taken when command is called
        @email = email
        @password = password

    end

    def call
        #this is where result gets reaturned
        JsonWebToken.encode(user_id: user.id) if user

    end

    private

    attr_accessor :email, :password

    def user
        user = user.find_by_email(email)
        return user if user && user.authenticate(password)
        errors.add :user_authentication,  'invalid credentials'
        nil
    end
end
