const express = require('express');
const app = require('./app');

const UserRepository = require('./repositories/UserRepository');

const routes = express.Router();

routes.get('/', UserRepository.getAllUserInformation);
routes.get('/user/:user_id', UserRepository.getUserInformation);

module.exports = routes;