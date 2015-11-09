$ ->
  $(document).ready ->
    $form = $("#sponsor-form")
    new Cfp.FormValidation($form)

    $form.on "ajax:success", (e)->
      $form.prev(".content").hide()
      $form.hide()
      $("#sponsor-contact-greeting").show()
