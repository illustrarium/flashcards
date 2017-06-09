function setScoreVal(score) {
  $('#time').val(score)
}
function setScore()  {
  var time = 1000;
  var score = 5;
  for(i = 0; i < 6; i++ ) {
    setTimeout(setScoreVal, time, score)
    time = time + 20000;
    score--;
  }
}

setScore();
