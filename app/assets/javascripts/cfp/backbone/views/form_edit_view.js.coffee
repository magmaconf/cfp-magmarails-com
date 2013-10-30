class Cfp.Views.FormEditView extends Backbone.View
  initialize: (options = {})->
   @scope = options.scope

  events:
    'change input[type="text"], textarea, select' : 'updateButtonLabel'

  updateButtonLabel: ->
   button = @$el.find('input[type="submit"]')
   button.val I18n.t('update', scope: @scope)
