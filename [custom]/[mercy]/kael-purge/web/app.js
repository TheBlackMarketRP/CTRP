
window.addEventListener('message', function(event) {
    let ev = event.data
    if(ev.action == "ShowNews") { 
      $(".breaking-container").css("display", "flex")
    }else if(ev.action == "HideNews"){
      $(".breaking-container").css("display", "none")
    }else if(ev.action == "ShowScores"){
      let myscore = ev.myscore
      let killlist = ev.KillsLists
      let scorehtml = ``
      $(".scoreboard").css("display", "block")

      $(".self").html(`Your Kills - ${myscore}`)

      killlist.forEach(function (dt) {
        scorehtml += `<li>${dt.name} - ${dt.kills}</li>`
      })      
      $(".scorelist").html(scorehtml)
    }else if(ev.action == "HideScores"){
      $(".scoreboard").css("display", "none")
    }
});


