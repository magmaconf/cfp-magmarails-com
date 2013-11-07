class Cfp.Views.RankingView extends Backbone.View
  #button = submit to control
  #btn = submit circle parent
  initialize: (@button)->
    @button.on 'click', @changeRank
    @btn = @button.parent()
    @setDefaultState()

  el: '#ranking'

  update:
    en: 'Update'
    es: 'Actualizar'

  events:
    'change input[name="rank"]' : 'unsetChecked'

  #Save the current selected value
  changeRank: =>
    rank = new Cfp.Models.Rank(value: @selectedRank())
    request = rank.save()
    request.success =>
      @setRankedState()

  #Have selected value?
  haveSelection: ->
    $('input[name="rank"]:checked', '#rank-list').length

  #Retrieve the current selected value
  selectedRank: =>
    @$('input[name="rank"]:checked').val()

  #Add btn-rated class to btn
  setRankedState: =>
    @btn.addClass('btn-rated ranked')

  #Set default class to btn
  setDefaultState: ->
    @setRankedState() if @haveSelection()

  #Remove btn-rated and change label when updating rate
  unsetChecked: ->
    @button.attr 'disabled', false
    @btn.removeClass('btn-rated')
    @button.html @buttonLabel() if @btn.hasClass('ranked')

  buttonLabel: ->
    @update[currentLocale]



