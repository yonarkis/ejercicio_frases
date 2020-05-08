"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _express = require("express");

var router = (0, _express.Router)();

var ctrlFrases = require('../controllers/frases.controller'); // api/entidades/


router.post('/encontrarFrases', ctrlFrases.encontrarFrases);
var _default = router;
exports["default"] = _default;