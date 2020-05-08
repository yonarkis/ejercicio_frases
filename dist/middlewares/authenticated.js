"use strict";

var jwt = require('jwt-simple');

var moment = require('moment');

var secret = 'clave_secreta';

exports.ensureAuth = function (req, res, next) {
  var payload;

  if (!req.headers.authorization) {
    return res.status(403).send({
      message: 'La petición no tiene la cabecera de autenticación'
    });
  }

  var token = req.headers.authorization.replace(/['"]+/g, ''); //console.log(token);

  try {
    var _payload = jwt.decode(token, secret); //console.log(payload);


    if (_payload.exp <= moment().unix()) {
      return res.status(401).send({
        message: 'El Token ha expirado'
      });
    }
  } catch (ex) {
    //console.log(ex);
    return res.status(404).send({
      message: 'Token no valido'
    });
  }

  req.user = payload;
  next();
};