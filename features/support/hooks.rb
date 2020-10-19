require "base64"
require "report_builder"
require "date"

Before do
  @home_page = HomePage.new
  @login_page = LoginPage.new

  page.driver.browser.manage.window.maximize
end

After do
  temp_shot = page.save_screenshot("log/tempshot.png")
  screenshot = Base64.encode64(File.open(temp_shot, "rb").read)
  embed(screenshot, "image/png", "Clique aqui para ver a evidência!")
end

d = DateTime.now
@current_date = d.to_s.tr(":","-")

at_exit do
  ReportBuilder.configure do |config|
    config.input_path = "log/report.json"
    config.report_path = "log/report_" + @current_date
    config.report_types = [:html]
    config.report_title = "Teste P4F - Web"
    config.compress_image = true
    config.additional_info = { "App" => "Web", "Data da Execução" => @current_date }
    config.color = "grey"
  end
  ReportBuilder.build_report
end
