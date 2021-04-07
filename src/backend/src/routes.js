const express = require('express');
const app = require('./app');

const UserRepository = require('./repositories/UserRepository');

const routes = express.Router();

routes.get('/', UserRepository.getAllUserInformation);

module.exports = routes;