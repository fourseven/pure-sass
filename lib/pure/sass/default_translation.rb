module Pure::Sass::DefaultTranslation

  def yuiCssPrefix
    'pure-'
  end

  def method_missing(method, *args)
    "$#{dasherize(method)}"
  end

  private

  def dasherize(str)
    str.to_s.gsub(/(.)([A-Z])/,'\1-\2').downcase
  end
end
