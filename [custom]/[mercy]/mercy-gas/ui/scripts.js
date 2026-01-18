let totalPatch = 0

window.addEventListener('message', function(event) {  
    switch(event.data.action) {
      case "HealthUI":
        var health = `conic-gradient(
            #91BADB ${event.data.left * 3.6}deg,
            #325a6a 0deg 360deg
        )`;
        $('.progress-container').css("display", "flex");
        $('#health').css("display", "block");
        $('.progress-circle-health').css("background", health);
        break;     
      case "ArmorUI":
        var armor = `conic-gradient(
            #91BADB ${event.data.left * 3.6}deg,
            #325a6a 0deg 360deg
        )`;
        $('.progress-container').css("display", "flex");
        $('#armor').css("display", "block");
        $('.progress-circle-armor').css("background", armor);
        break;     
      case "StaminaUI":
        var stamina = `conic-gradient(
            #91BADB ${event.data.left * 3.6}deg,
            #325a6a 0deg 360deg
        )`;
        $('.progress-container').css("display", "flex");
        $('#stamina').css("display", "block");
        $('.progress-circle-stamina').css("background", stamina);
        break;     
      case "StressUI":
        var stress = `conic-gradient(
            #91BADB ${event.data.left * 3.6}deg,
            #325a6a 0deg 360deg
        )`;
        $('.progress-container').css("display", "flex");
        $('#stress').css("display", "block");
        $('.progress-circle-stress').css("background", stress);
        break;     
      case "HealthOff":
        $('#health').css("display", "none");
        break;     
      case "ArmorOff":
        $('#armor').css("display", "none");
        break;     
      case "StaminaOff":
        $('#stamina').css("display", "none");
        break;     
      case "StressOff":
        $('#stress').css("display", "none");
        break;     
      case "CloseBoost":
        CloseBoost();
        break;
    }

});





CloseBoost = function() {
  $('.progress-container').css("display", "none");
  $.post(`https://${GetParentResourceName()}/close`);
}


