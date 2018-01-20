var player;
var playerTop;
var playerLeft;
$(function(){
   player = $('#current_user');
   playerTop = player.css('top').match(/[0-9]+/);
   playerLeft = player.css('left').match(/[0-9]+/);
  $(document).on('keypress', triggerKeys);
});

function triggerKeys(e){
  var speed = 11;
  if (e.charCode == 119) updateTopPos(-speed);
  else if (e.charCode == 97) updateLeftPos(-speed);
  else if (e.charCode == 115) updateTopPos(speed);
  else if (e.charCode == 100) updateLeftPos(speed);

  $.map($('.env'), function(element){
    console.log(playerTop + ' ' + playerLeft);
    console.log($(element).css('top').match(/[0-9]+/) * 1 > player.top);
  });
}

function updateTopPos(value){
  if (value > 0) player.find('img').css('transform', 'rotate(180deg)');
  else player.find('img').css('transform', 'rotate(0deg)');

  currentTopCss = player.css('top').match(/[0-9]+/) * 1;
  player.css('top', currentTopCss += value);
  playerTop = currentTopCss += value;
}

function updateLeftPos(value){
  if (value > 0) player.find('img').css('transform', 'rotate(90deg)');
  else player.find('img').css('transform', 'rotate(-90deg)');

  currentLeftCss = player.css('left').match(/[0-9]+/) * 1;
  player.css('left', currentLeftCss += value);
  playerLeft = currentLeftCss += value;
}
