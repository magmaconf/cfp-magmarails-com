class Cfp.Views.SubmitComment extends Backbone.View
  events:
    'keyup textarea' : 'checkValue'

  checkValue: (event) ->
    textareaValue = $(event.target).val()
    content = textareaValue.trim()
    @toggleSubmit(!content.length)

  toggleSubmit: (disabled) ->
    @$el.find('input[type="submit"]').attr('disabled', disabled)

