function Udskrivdata() {
    fetch('http://localhost:3000/arrengement/' + document.querySelector('#selectkategori').value)
        .then((response) => {
            return response.json();
        })
        .then((data) => {

            document.getElementById('content').innerHTML = '';
            data.forEach (udskriv => {
                document.getElementById('content').innerHTML += udskriv.titel + "<br>";
                document.getElementById('content').innerHTML +=  udskriv.varighed + " " +  "min" + "<br>";
                document.getElementById('content').innerHTML +=  udskriv.Pris + " " +  "Kr." + "<br>";
                document.getElementById('content').innerHTML +=  udskriv.beskrivelse + "<br>";
        document.getElementById('content').innerHTML += `<img src="/images/${udskriv.billede}">  <br>`; 
                console.log(udskriv);
            });
        })

}

if (navn != "" && pris != "" && varenummer != "" && beskrivelse != "" && billede != "") {

    var sql = `
            INSERT INTO arrengement
            SET
                titel = ?,
                varighed = ?,
                pris = ?,
                fk_kategori = ?,
                beskrivelse = ?,
                billede = ?
            `;

    database.query(sql, [titel, varighed, pris, fk_kategori, beskrivelse, billede], function (err, result) {
        if (err) {
            console.log("Stor fed fejl: " + err);
        } else {
            writeStream.write(date + ` <------ Produkt oprettet ------->` + os.EOL, 'utf8');
            res.redirect('/produkter');
        }

    });


};

function soge () {
    const selectid2 = document.getElementById("soge").value;
    // console.log(selectid);
    fetch(`http://localhost:3000/sog/${selectid2}`)
        .then((response) => {
        if (response.ok) {
            return response.json();
        }
        })
        .then((json) => {
            let list = '<div>'

        for (let i = 0; i < json.length; i++) {
            list += `
                <div class="produkt">
                    <h3>Titel: ${json[i].titel}</h3>
                    <p>Varighed: ${json[i].varighed}</p>
                    <p>Pris: ${json[i].Pris} Kr.</p>
                </div>`;
        }

        list += `</div`;

        document.querySelector('#productsList1').innerHTML = list;
        })
        .catch((err) => {
        console.log(err);
        })
}

