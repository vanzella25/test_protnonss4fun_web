class HomePage
    include Capybara::DSL

    def go 
        visit "http://automationpractice.com/index.php"
    end

    def login_click
        click_link "Sign in"
    end
end