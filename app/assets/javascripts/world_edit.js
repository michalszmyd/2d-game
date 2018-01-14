var minusTop = 86 + 32;
$(function(){
  $('.env-item').on('click', dragEnvItem);
  $('.save-world').on('click', modifyWorldRequest);
});

function dragEnvItem(e){
  var image = $(this).find('img').attr('src');
  var envId = $(this).data('id');
  var item = $('<div class="new-env env" data-env-id="' + envId + '" style="position: fixed; z-index: 100;"><img src="' + image + '" /></div>');
  var currentlyDragging = false;

  $('.world').append(item);
  var itemMove = $(document).on('mousemove', function(e){
    item.css({
      left: e.clientX,
      top: e.clientY
    });
    currentlyDragging = true;
  });

  var releaseDrag = $(document).on('click', function(e){
    if (currentlyDragging) {
      itemMove.off();
      releaseDrag.off();
      $(item).css({
        'position': 'absolute',
        left: e.pageX,
        top: e.pageY
      });
      currentlyDragging = false;
    }
  });
}

function modifyWorldRequest(){
  world_environments = []
  $('.new-env').each(function(index, item){
    catched = $(item);
    id = catched.data('env-id')
    positionX = catched.css('left').match(/[0-9]+/)[0]*1;
    positionY = catched.css('top').match(/[0-9]+/)[0]*1 - minusTop;

    world_environments[index] = {
      world_environment: {
        environment_id: id,
        position_x: positionX,
        position_y: positionY
      }
    };
  });
  if (world_environments.length > 0){
    sendData(world_environments);
  }
  else {
    alert('You dont add any new items');
  }
}

function sendData(world_environments){
  $.ajax({
    url: window.location.href + '/save_env',
    data: { world_environments },
    method: 'POST',
    success: function(){
      alert('Correct callback');
    },
    error: function(){
      alert('Error xD');
    }
  });

  $('.new-env').removeClass('new-env');
}
