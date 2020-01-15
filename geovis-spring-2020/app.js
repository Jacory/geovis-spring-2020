const express = require('express');
const app = express();

app.use(express.static(__dirname + '/public'));

app.listen(9000, () => {
    console.log('Started on port 9000');
});

module.exports = app;

HTMLAllCollection