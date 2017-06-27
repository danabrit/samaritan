@updateStateOptions = (states) ->
  $stateSelect = $("#project_region")
  for state in states
    option = "<option value='#{state.symbol}'>#{state.name}</option>"
    $stateSelect.append(option)    

$ ->
  $("#project_country").on "change", () ->
    $countryCode = $(this).val()
    $regionSelect = $("#project_region")

    $regionSelect.empty()
    if $countryCode != "US"
      $regionSelect.append("<option value=''></option>")

    $.ajax
      type: "POST",
      url: "/time_zones/states_for_country",
      data: "country_code=#{$countryCode}",
      dataType: "json",
      success: (data, _status, _jqxhr) ->
        updateStateOptions(data)

