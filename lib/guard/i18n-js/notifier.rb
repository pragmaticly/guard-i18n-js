# encoding: utf-8

module Guard
  class I18nJS
    class Notifier
      class << self
        def guard_message(result, duration)
          case result
          when true
            "I18n::JS translations has been exported\nin %.1f seconds." % [duration]
          else
            "I18n::JS translations can't be exported,\nplease check manually."
          end
        end

        # failed | success
        def guard_image(result)
          icon = if result
                   :success
                 else
                   :failed
                 end
        end

        def notify(result, duration)
          message = guard_message(result, duration)
          image   = guard_image(result)

          ::Guard::Notifier.notify(message, :title => 'I18n::JS export', :image => image)
        end
      end
    end
  end
end
