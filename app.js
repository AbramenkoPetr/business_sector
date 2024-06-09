const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2');
const app = express();
const urlencodedParser = express.urlencoded({extended: false});

const port = 3002;

app.use(express.json());


 // создаем соединение с нашей базой данных
 const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    //password: "123456",
    database: "test",
    //port: "3306"
  });



  // открываем наше соединение с базой данных
  connection.connect(err => {
    if (err) throw err;
    //console.log("успешно соединено с базой данных");
  });

//Регистрция пользователя
app.post('/user/register', function(req, res) {
    //console.log('receiving data ...');
    connection.query('SELECT * FROM users WHERE email = ?', `${req.body.email}`,  (error, result) => {
      const EMAIL_REGEXP = /^(([^<>()[\].,;:\s@"]+(\.[^<>()[\].,;:\s@"]+)*)|(".+"))@(([^<>()[\].,;:\s@"]+\.)+[^<>()[\].,;:\s@"]{2,})$/iu;
      //console.log('EMAIL_REGEXP.test ', EMAIL_REGEXP.test(req.body.email));
      if (!EMAIL_REGEXP.test(req.body.email)) {
        console.log('Невалидный email ', req.body.email);
        res.send('Невалидный email '+ req.body.email);
        return;
      }
      
      if (error) throw error;
      if (result.length != 0) {
        console.log('Пользователь ', req.body.email, ' уже зарегистрирован');
        res.send('Пользователь '+ req.body.email + ' уже зарегистрирован');
        return;
      }
      
        //console.log('EMAIL_REGEXP.test ', EMAIL_REGEXP.test(req.body.email));
        const Body = req.body;
        Body.registration_date = new Date();
        //console.log('Body is ',Body);
    
        connection.query('INSERT INTO users SET ?', Body, (error, result) => {
        
          console.log(`User added with ID: ${result.insertId}`);
          if (error) throw error;
          res.json(Body)
          
        });

    });
  
    
});

//Авторизация пользователя
app.post('/user/login', function(req, res) {
  //console.log('receiving data ...');
  //console.log('Body is ',req.body);
  
  connection.query('SELECT * FROM users WHERE email = ?', `${req.body.email}`, (error, result) => {
      
    if (error) throw error;
    if (result.length === 0) {
      console.log('Нет такого пользователя ', req.body.email);
      res.send('Нет такого пользователя '+ req.body.email);
      return;
    }
    //console.log('result: ', result);
    //console.log('result.password: ', result[0].password, 'req.body.password: ', req.body.password);
    
    if (result[0].password === req.body.password) {
      console.log('Успешная авторизация пользователя', req.body.email);
      res.send('Успешная авторизация пользователя '+ req.body.email);
    }
    else {
      console.log('Неправильный пароль');
      res.send('Неправильный пароль');
    }
  });

  
});

//Редактирование пользователя
app.put('/profile/:id', function(req, res) {
  //console.log('receiving data ...');
  const id = req.params.id;
  let Body = req.body;   
  console.log('Body is ',req.body);
  if (Body.id) delete Body.id;
  if (Body.password) delete Body.password;
  if (Body.registration_date) delete Body.registration_date;
  connection.query('UPDATE users SET ? WHERE id = ?', [Body, id], (error, result) => {
    
    if (error) throw error;
    
    res.json('Изменения выполнены успешно.');
  });
  
});

//Получение пользователя
app.get('/profile/:id', function(req, res) {
  //console.log('receiving data ...');
  const id = req.params.id;
      
  //console.log('Body is ',req.body);
  
  connection.query('SELECT * FROM users WHERE id = ?',  id, (error, result) => {
    
    if (error) throw error;
    
    res.json(result);
  });
  
});


//Получение всех пользователей
app.get('/profiles', function(req, res) {
  

  connection.query('SELECT * FROM users', (error, result)   =>  {
    //console.log(result);
    if (error) throw error;
    if (result.length === 0) {
      console.log('Нет записей ');
      res.send('Нет записей ');
      return;
    }

    var users = [];
    var page = req.query.page;
    page = Number(page);
    
    const lengthUsers = result.length;
    let istart = (page -1)*10;
    if (istart > lengthUsers -1) {
      res.send('Нет такой страницы пользователей');
      return;
    }
    let iend = istart + 9;
    if (iend > lengthUsers -1)  iend = lengthUsers -1;
    for (i = istart; i <= iend; ++i) {
      users.push(result[i]);
  }

    //console.log('users ', users);
    res.json(users);
    
});
});

// Start the server 
const server = app.listen(port, (error) => {
    if (error) return console.log(`Error: ${error}`);
    console.log(`Server listening on port ${server.address().port}`);
});
