class Cfp.Views.FormEditView extends Backbone.View
  update:
    en: 'Update'
    es: 'Actualizar'

  events:
    'change input[type="text"], textarea, select' : 'updateButtonLabel'

  updateButtonLabel: ->
   button = @$el.find('input[type="submit"]')
   button.val @buttonLabel()

  buttonLabel: ->
    @update[currentLocale]
