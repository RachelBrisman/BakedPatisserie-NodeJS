process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0';
const express = require('express');
const app = express();
const mysql = require('mysql');
const nodemailer = require('nodemailer');
const { name } = require('pug/lib');
const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));


const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: '358project'
});

db.connect((err) => {
  if(err) throw err;
  console.log('MySQL connection established');
});

app.set('view engine', 'pug');
app.use(express.static(__dirname + '/public'));



app.get('/', (req, res) => {
    res.render('index', {
        title: 'Home'
      });
  });

app.get('/contact', (req, res) => {
    res.render('contact', {
        title: 'Contact Us'
      });
  });

  app.get('/order', (req, res) => {
    res.render('order', {
        title: 'Place an Order'
      });
  });

  app.post('/processContact', (req, res) => {
      var transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
          user: 'bakedpatisserie358@gmail.com',
          pass: 'MCON358!'
      }
      });
  
      var mailOptions = {
      from: 'bakedpatisserie358@gmail.com',
      to: req.body.email,
      subject: 'Contact Form Submission',
      text: 'Hi ' + req.body.name + '! \nWe received the following message successfully:\n' + req.body.content +'\nOne of our service representatives will reach out to you shortly.'
      };
  
      transporter.sendMail(mailOptions, (error, info) => {
          if (error) {
              console.log(error);
          } else {
            console.log('Email sent successfully');
          }
      });
    res.render('confirmContact', {
      title: 'Hi ' + req.body.name + '!'
    });
  });

  app.post('/orderProcess', (req, res) => {
    let order = {custname: req.body.name, 
                phone: String(req.body.phone), 
                email: req.body.email, 
                Chocolate_Chip_Cookies: req.body.ccc,
                Peanut_Butter_Cookies: req.body.pbc,
                Chocolate_Cupcakes: req.body.cc,
                Vanilla_Cupcakes: req.body.vc,
                Chocolate_Babka: req.body.cb,
                Vanilla_Babka: req.body.vb,
                Cinnamon_Babka: req.body.cnb,
                Assorted_Rugelach: req.body.ar,
                };
    let sql = 'INSERT INTO orderinfo SET ?';
    let query = db.query(sql, order, (err, results) => {
      if (err) throw err;
      console.log(results);
    });
    res.render('processOrder', {
        title: 'Your Order Has Been Received!'
    });
  });

  app.get('/products', (req, res) => {
    let sql = 'SELECT * FROM products'
    let query = db.query(sql, (err, results) => {
      if (err) throw err;
      console.log(results);
      res.render('products', {
          title: 'Products',
          results: results
      });
    });
  });

const server = app.listen(7000, () => {
    console.log(`Express running → PORT ${server.address().port}`);
  });