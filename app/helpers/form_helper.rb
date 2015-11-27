module FormHelper
  def error_messages
    t('errors.form').each_with_object({}) do |err, obj|
      obj["errormessage-#{err.first.to_s.dasherize}"] = err.last
    end
  end
end
