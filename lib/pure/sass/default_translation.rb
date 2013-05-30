module Pure::Sass
  class DefaultTranslation

    def yuiCssPrefix
      '.pure-'
    end
    alias_method :prefix, :yuiCssPrefix

    def skinName
      "default"
    end

    def method_missing(method, *args)
      "$#{dasherize(method)}"
    end

    private

    def dasherize(str)
      str.to_s.gsub(/(.)([A-Z])/,'\1-\2').downcase
    end
  end
end
