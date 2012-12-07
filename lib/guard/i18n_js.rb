require 'guard'
require 'guard/guard'
require 'i18n-js'

module Guard
  class I18nJS < Guard
    autoload :Notifier, 'guard/i18n-js/notifier'

    def start
      refresh_translations
    end

    def reload
      refresh_translations
    end

    def run_all
      true
    end

    def stop
      true
    end

    def run_on_additions(paths = [])
      refresh_translations
    end

    def run_on_modifications(paths = [])
      refresh_translations
    end

    private

    def refresh_translations
      ::Guard::UI.info 'Refresh I18n::JS translations', :reset => true
      start_at = Time.now
      @result = system("bundle exec rails runner I18n::JS.export")
      Notifier.notify(@result, Time.now - start_at)
      @result
    end
  end
end
