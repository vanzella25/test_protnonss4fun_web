class LoginPage
    include Capybara::DSL

    def login_with(email, password)
        find("#email").set email
        find("#passwd").set password
        find("#SubmitLogin").click
    end

    def alert
        find(".alert-danger").text
    end

    def loged_user
        find(".header_user_info .account").text
    end
end