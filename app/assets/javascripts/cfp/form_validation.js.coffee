class Cfp.FormValidation
  constructor: (@$form) ->
    @$form.on 'submit', @validateForm

  validateForm: (event) =>
    @cleanFields()
    @isValid(field) for field in @requiredFields()
    @displayErrors()
    !@invalidFields.length

  requiredFields: =>
    @$form.find(':required')

  isValid: (field) ->
    if $(field).is(':required') and !field.checkValidity()
      @invalidFields.push $(field)


  cleanFields: =>
    @invalidFields = []
    @$form.find('.required').removeClass 'invalid'

  displayErrors: =>
    for field in @invalidFields

      field.prev('.error').text(field[0].validationMessage)
      field.parent('.required').addClass('invalid')
