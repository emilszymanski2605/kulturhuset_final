var database = require('../config/database').connect();

module.exports = function (app) {
    //index siden
    app.get('/', function (req, res) {
        database.query("SELECT * FROM arrengement", (error, rows) => {
           
                res.render('pages/index', {
                    side: "index",
                    arrengement: rows,
                    
                });
            
        });
    });
    app.get("/arrengement/:kategori", function(req, res) {
        database.query(
          "SELECT * FROM arrengement WHERE fk_kategori = ? ",
          [req.params.kategori],
          (error, rows) => {
            res.json(rows);
          }
        );
      });

      app.post("/arrengement/", function(req, res) {
        database.query(
          "SELECT * FROM  ",
          [req.params.kategori],
          (error, rows) => {
            res.json(rows);
          }
        );
      });

    app.get('/Omos', function (req, res) {
                res.render('pages/Omos', {
                    side: "Omos",   
                });
            
        });

        app.get('/admin', function (req, res) {
            res.render('pages/admin', {
                side: "admin",   
            });
        
    });

    app.delete('/arrengement/:id');
    
    app.get("/sog/:soog", function(req, res) {
      database.query(
        `SELECT * FROM arrengement WHERE titel LIKE '%${req.params.soog}%'`,
        // [req.params.soog],
        (error, rows) => {
          res.json(rows);
        }
      );
    });
    
}

