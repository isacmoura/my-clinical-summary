const express = require('express');
const routes = require('./routes');
const cors = require('cors');
const bodyParser = require('body-parser');
const path = require('path');

const app = express();

app.use(bodyParser.urlencoded({ extended: true })); 
app.use(bodyParser.json());
app.use(cors());
app.use(express.json());
app.use(routes);

module.exports = app;