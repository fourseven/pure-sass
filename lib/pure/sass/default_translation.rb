module Pure::Sass
  class DefaultTranslation

    def yuiCssPrefix
      '.pure-'
    end
    alias_method :prefix, :yuiCssPrefix

    # We are currently regex'ing this out.
    def skinName
      "IM_GONNA_CUT_YOU_SO_BAD_YOU_GONNA_WISH_I_DIDNT_CUT_YOU_SO_BAD"
    end

    def method_missing(method, *args)
      "$#{dasherize(method)}"
    end

    def respond_to?(method_name)
      true
    end

    private

    def dasherize(str)
      str.to_s.gsub(/(.)([A-Z])/,'\1-\2').downcase
    end
  end
end
