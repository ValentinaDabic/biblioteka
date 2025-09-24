const express = require('express');
const cors = require('cors'); 
const app = express();


app.use(cors());

app.use(express.urlencoded());
app.use(express.json()); 

app.get('/', (req, res) => {
    res.send('Dobrodošli u BiblioSferu!');
});

const mysql = require('mysql');

let baza = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'biblio-sfera'
});

baza.connect(function(greska){
    if(greska) throw greska;

    console.log('Spojen na bazu.');

    app.get('/knjige/dohvati', (req, res) => {
        baza.query("SELECT * FROM knjige;", function(err, result, fields){
            res.json(result);
        });
    });

    app.post('/knjige/dodaj', (req, res) => {
        let naslov = req.body.naslov;
        let autor = req.body.autor;
        let cijena = req.body.cijena;
        let slika = req.body.slika;

        baza.query("INSERT INTO knjige (naslov, autor, cijena, slika)" + 
            "VALUES ('" + naslov + "','" + autor + "', '" + cijena + "', '" + slika + "');", 
            function(err, result, fields){
            res.send('Knjiga dodana!');
        });
    });

    app.put('/knjige/uredi/:id', (req, res) => {
        const id = req.params.id;
        const { naslov, autor, cijena } = req.body;

        if (!naslov || !autor || !cijena) {
            return res.status(400).send('Molimo unesite sve potrebne podatke.');
        }

        const query = `UPDATE knjige 
                    SET naslov = ?, autor = ?, cijena = ? 
                    WHERE id = ?`;
                    
        baza.query(query, [naslov, autor, cijena, id], function (err, result) {
            if (err) {
                console.error('Greška prilikom ažuriranja knjige:', err);
                return res.status(500).send('Greška prilikom ažuriranja knjige.');
            }

            if (result.affectedRows === 0) {
                return res.status(404).send('Knjiga nije pronađena.');
            }

            res.send('Knjiga je uspješno ažurirana!');
        });
    });

    app.delete('/knjige/izbrisi/:id', (req, res) => {
        let id = req.params.id;
    
        let sql = `DELETE FROM knjige WHERE id = ?`;
        
        baza.query(sql, [id], (err, result) => {
            if (err) {
                console.error('Greška prilikom brisanja knjige:', err);
                return res.status(500).send('Greška prilikom brisanja knjige.');
            }
            res.send('Knjiga uspješno izbrisana!');
        });
    });
});

app.listen(3000, () => {
    console.log('Pokrenut express.');
});