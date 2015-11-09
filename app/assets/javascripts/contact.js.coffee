$ ->
  $(document).ready ->
    $form = $('#sponsor-form')
    new Cfp.FormValidation($form)

    $form.on 'ajax:complete', ->
      console.log "x"
