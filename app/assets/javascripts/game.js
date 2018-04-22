var player;
var playerTop;
var playerLeft;
$(function(){
  loadHeroItems();
  player = $('#current_user');
  playerTop = player.css('top').match(/[0-9]+/);
  playerLeft = player.css('left').match(/[0-9]+/);
  $(document).on('keypress', triggerKeys);
  $('.eq-modal').on('mouseenter', '.slot', showItemInfo);
});

function loadHeroItems(){
  $.ajax({
    url: 'api/items',
    success: function(data){
      data.forEach(function(item){
        $('.bag').append(renderItem(item));
      });

      for(i = 0; i < 30 - data.length; i++){
        $('.bag').append('<div class="empty-slot"></div>');
      }
    }
  })
}

function renderItem(item){
  usable = (item.class_name == $(player).data('hero-class'));
  itemDiv = usable ? '<div class="slot">' : '<div class="slot locked">';
  return itemDiv +
    '<img src="' + item.image + '" />' +
    '<div class="item-info"' +
      'data-name="' + item.name + '"' +
      'data-wear-place="' + item.wear_place + '"' +
      'data-damage="' + item.damage + '"' +
      'data-mana="' + item.mana + '"' +
      'data-armor="' + item.armor + '"' +
      'data-class="' + item.class_name + '"' +
  '</div>';
}

function triggerKeys(e){
  if (e.charCode == 105) {
    $('.eq-modal').fadeToggle(100);
  }
  else {
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

function showItemInfo(){
  item = $(this).find('.item-info');

  name = item.data("name");
  wear_place = item.data("wear-place");
  damage = item.data("damage");
  mana = item.data("mana");
  armor = item.data("armor");
  className = item.data("class");

  $('.eq-modal .info').html(
    '<img src="' + $(this).find('img').attr('src') + '" />' +
    '<h2>' + name + '</h2>' +
    '<span class="description">' +
      '<p>Wear place: ' + wear_place + '</p>' +
      '<p>Damage: ' + damage + '</p>' +
      '<p>Mana: ' + mana + '</p>' +
      '<p>Armor: ' + armor + '</p>' +
      '<p>Class: ' + className + '</p>' +
    '</span>'
  )
}
