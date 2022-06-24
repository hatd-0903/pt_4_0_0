require "capybara/dsl"

class CrawlAmbii
  include Capybara::DSL
  Capybara.run_server = false
  Capybara.register_driver :crawl_ambi do |app|
    Capybara::Webkit::Driver.new(app, CrawlAmbii.drive_config)
  end

  Capybara.current_driver = :crawl_ambi

  LOGIN_PATH = "/company_login/login/".freeze
  LOGIN_BUTTON = "ログイン".freeze
  CSV_BUTTON = "CSVファイルの作成".freeze
  DOWNLOAD_BUTTON = "ダウンロード".freeze

  def perform
    headless = Headless.new
    headless.start
    Capybara.app_host = "https://en-ambi.com"
    visit LOGIN_PATH
  rescue Headless::Exception, Capybara::Webkit::ConnectionError, NoMethodError, StandardError => e
    puts e
    raise e
  ensure
    Capybara.reset!
    headless.stop
  end

  class << self
    def drive_config
      {
        allowed_urls: ["*"],
        block_unknown_urls: false,
        blocked_urls: [],
        debug: true,
        ignore_ssl_errors: true,
        proxy: nil,
        skip_image_loading: true,
        timeout: 60
      }
    end
  end
end
