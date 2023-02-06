Before do
  window = Capybara.current_session.current_window
  window.maximize
end

def add_screenshot(scenario)
  sufix = ('error' if scenario.failed?) || 'success'
  name = scenario.name.tr(' ', '_').downcase
  foto = save_screenshot("images/#{sufix}-#{name}.png")
  base64_img = Base64.encode64(File.open(foto, 'rb:UTF-8', &:read))
  attach(base64_img, 'image/png;base64')
end
After do |scenario|
  add_screenshot(scenario) if BROWSER == 'chrome'
  Capybara.current_session.quit
end
at_exit do
  time = Time.now
  ReportBuilder.configure do |config|
    config.json_path = 'relatorios/report.json'
    config.report_path = 'relatorios/cucumber_relatorio'
    config.report_types = [:html]
    config.report_title = 'Testes Automatizados'
    config.compress_images = false
    config.color = 'blue'
    config.additional_info = {:Navegador => 'Chrome', :Ambiente => 'QA', 'Report generated' => time}
  end
  ReportBuilder.build_report
end
