var $ = Dom7;

var app = new Framework7({
  root: '#app',
  name: 'Appenda Portuges',
  id: 'com.myapp.test',
  routes: [
     {
      path: '/main/',
      url: './pages/main/index.html',
      tabs: [
      {
        path: '/',
        // Tab id
        id: 'games',
        url: './pages/main/games.html'
      },
      // Second tab
      {
        path: '/search/',
        id: 'search',
        // Fill this tab content with Ajax request:
        templateUrl: './pages/main/search.html'
      },
      // Third tab
      {
        path: '/words/',
        id: 'words',
        templateUrl: './pages/main/words.html',
        
      }
      ],
      options: {
		context: {
			  localword_count: function(){
				  var count = localStorage.getItem('localword_count');
				  return count != null ? count : 0 ;
			  },
			  remoteword_count: function(){
				  var count = localStorage.getItem('remoteword_count');
				  return count != null ? count : 0 ;
			  },
			  words: get_words
			}
	   }
    },
    {
      path: '/about/',
      url: './pages/about.html',
      
    },
    {
      path: '/games/mappings',
      templateUrl: './pages/games/mappings.html',
      options: {
		context: {
			  words: function(){
				  var words = localStorage.getItem('uniq_words_8');
				  words = JSON.parse(words);
				  words.sort(function(a, b) {
					  return Math.random() - 0.5;
				  });
				  return words;
			  }
			}
	   }
    },
    {
      path: '/games/mappings/win/',
      url: './pages/games/mapping_win.html',
    },
    
  ],
  notification: {
    title: 'Mensagem',
    closeTimeout: 3000,
  }
});

var mainView = app.views.create('.view-main');
app.router.navigate('/main/');

function get_words(){
	var words = localStorage.getItem('words');
	return words != null ? JSON.parse(words) : [];
}

$(document).on('submit', '#save_word_form', function (e) {
	e.preventDefault();
	var formData = app.form.convertToData('#save_word_form');
	formData.word_1 = formData.word_1.trim();
	formData.word_2 = formData.word_2.trim();
	var words = get_words();
	var same_word = false;
	for(i in words){
		if(words[i].word_1.toLowerCase() == formData.word_1.toLowerCase() && words[i].word_2.toLowerCase() == formData.word_2.toLowerCase()){
			same_word = true;
			break;
		}
	}
	if(same_word){
		app.notification.create({
		  text: 'Esta palavra já está no dicionário',
		  closeOnClick: true
		}).open();
		return 0;
	}
	words.push(formData);
	words.sort(function (a, b) {
	  if (a.word_1 > b.word_1) {
		return 1;
	  }
	  if (a.word_1 < b.word_1) {
		return -1;
	  }
	  return 0;
	});
	localStorage.setItem('words', JSON.stringify(words));
	formData.word_1 = "";
	formData.word_2 = "";
	app.form.fillFromData('#save_word_form', formData);
	var localword_count = parseInt($('#localword_count').text());
	localword_count++;
	$('#localword_count').text(localword_count);
	localStorage.setItem('localword_count', localword_count);
});

$(document).on('click', '#clear_data', function () {
	localStorage.clear();
});

$(document).on('click', '#play_game_mapping', function () {
	var words = get_words();
	if(words.length > 7){
		var words = get_words();
		words = getUnique(words, 8);
		localStorage.setItem('uniq_words_8', JSON.stringify(words));
		app.router.navigate('/games/mappings');
	}
	else{
		app.notification.create({
		  text: 'Para iniciar o jogo você precisa de pelo menos 8 palavras',
		  closeOnClick: true
		}).open();
	}
});


function getUnique(arrayNum, count) {
  var tmp = arrayNum.slice(arrayNum);
  var ret = [];
  for (var i = 0; i < count; i++) {
    var index = Math.floor(Math.random() * tmp.length);
    var removed = tmp.splice(index, 1);
    ret.push(removed[0]);
  }
  return ret;  
}

$(document).on('click', '.mapping_game li', function () {
	if($(this).hasClass('cur')){
		$(this).removeClass('cur');
		return 0;
	}
	var ul = $(this).closest('ul');
	var cur_len = ul.find('.cur').length;
	if(cur_len == 0){
		$(this).addClass('cur');
	}
	var t1 = $('.mapping_game.ul_1 .cur a').text();
	var t2 = $('.mapping_game.ul_2 .cur a').text();
	if(t1 != null && t2 != null){
		var word_2 = $('.mapping_game.ul_1 .cur').data('word_2');
		if(t2 == word_2){
			$('.mapping_game.ul_1 .cur').remove();
			$('.mapping_game.ul_2 .cur').remove();
			var mapping_score = parseInt($('#mapping_score').val())  + 1;
			$('#mapping_score').val(mapping_score);
			if(mapping_score == 8){
				app.router.navigate('/games/mappings/win/');
			}
		}
		$('.mapping_game .cur').removeClass('cur');
	}
});


$(document).on('click', '#sync', function () {
	app.preloader.show();
	var words = get_words();
	words = words.filter((e) => e.type == 'new');
	app.request.post('http://das-kapital.ru/api/ap/sync.php', { words: words }, function (data) {
		data = JSON.parse(data);
		var count = data.length;
		data.sort(function (a, b) {
		  if (a.word_1 > b.word_1) {
			return 1;
		  }
		  if (a.word_1 < b.word_1) {
			return -1;
		  }
		  return 0;
		});
		localStorage.setItem('words', JSON.stringify(data));
		$('#localword_count').text(count)
		$('#remoteword_count').text(count);
		localStorage.setItem('localword_count', count);
		localStorage.setItem('remoteword_count', count);
		app.preloader.hide();
	},
	function(){
		app.preloader.hide();
		app.notification.create({
		  text: 'Error',
		  closeOnClick: true
		}).open();
	});
	
});
