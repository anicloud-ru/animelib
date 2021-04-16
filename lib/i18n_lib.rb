require 'i18n'

module I18nLib
  LOCALES = {
    'russian' => :ru,
    'english' => :en
  }

  def self.russian?
    I18n.locale == :ru
  end
end