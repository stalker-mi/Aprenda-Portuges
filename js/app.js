



var app = new Framework7({
  root: '#app',
  name: 'Appenda Portuges',
  id: 'com.myapp.test',
  routes: [
    {
      path: '/about/',
      url: './pages/about.html',
    },
  ]
});

var mainView = app.views.create('.view-main');
