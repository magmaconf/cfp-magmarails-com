class Cfp.Views.RankingView extends Backbone.View
  el: '#ranking'

  events:
    'click #submit-rank' : 'changeRank'

  changeRank: ->
    rank = new Cfp.Models.Rank
    rank.save
      value: @selectedRank()

  selectedRank: =>
    @$('input[name="rank"]:checked').val()
