class Cfp.FormValidation
  constructor: (@$form) ->
    @$form.on 'submit', @validateForm

  validateForm: (event) =>
    @cleanFields()
    @isValid(field) for field in @requiredFields()
    @displayErrors()
    !@invalidFields.length

  requiredFields: =>
    @$form.find('.required').find('input, textarea')

  isValid: (field) ->
    @invalidFields.push $(field) unless !!$(field).val()

  cleanFields: =>
    @invalidFields = []
    @$form.find('.required').removeClass 'invalid'

  displayErrors: =>
    for field in @invalidFields
      field.parent('.required').addClass('invalid')
