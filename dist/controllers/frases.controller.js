"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.encontrarFrases = encontrarFrases;

function asyncGeneratorStep(gen, resolve, reject, _next, _throw, key, arg) { try { var info = gen[key](arg); var value = info.value; } catch (error) { reject(error); return; } if (info.done) { resolve(value); } else { Promise.resolve(value).then(_next, _throw); } }

function _asyncToGenerator(fn) { return function () { var self = this, args = arguments; return new Promise(function (resolve, reject) { var gen = fn.apply(self, args); function _next(value) { asyncGeneratorStep(gen, resolve, reject, _next, _throw, "next", value); } function _throw(err) { asyncGeneratorStep(gen, resolve, reject, _next, _throw, "throw", err); } _next(undefined); }); }; }

function encontrarFrases(_x, _x2) {
  return _encontrarFrases.apply(this, arguments);
}

function _encontrarFrases() {
  _encontrarFrases = _asyncToGenerator(
  /*#__PURE__*/
  regeneratorRuntime.mark(function _callee(req, res) {
    var _req$body, texto, arrayFrases, sinEspacio, matrizTexto, salida, j, sinEspacio2, matrizFrases, letrasUsadas, i, index, indice, y, letraUsada, indiceLetras;

    return regeneratorRuntime.wrap(function _callee$(_context) {
      while (1) {
        switch (_context.prev = _context.next) {
          case 0:
            _req$body = req.body, texto = _req$body.texto, arrayFrases = _req$body.arrayFrases;
            _context.prev = 1;
            sinEspacio = texto.replace(/ /g, "");
            matrizTexto = sinEspacio.split("");
            salida = [];

            if (!(typeof arrayFrases == "undefined" || arrayFrases === null)) {
              _context.next = 9;
              break;
            }

            res.json({
              msg: "El array de frases esta vacio"
            });
            _context.next = 34;
            break;

          case 9:
            j = 0;

          case 10:
            if (!(j < arrayFrases.length)) {
              _context.next = 33;
              break;
            }

            sinEspacio2 = arrayFrases[j].replace(/ /g, "");
            matrizFrases = sinEspacio2.split("");
            letrasUsadas = [];
            i = 0;

          case 15:
            if (!(i < matrizTexto.length)) {
              _context.next = 29;
              break;
            }

            index = matrizTexto[i];
            indice = matrizFrases.indexOf(index);

            if (indice > -1) {
              matrizFrases.splice(indice, 1);
            }

            if (!(matrizFrases.length === 0)) {
              _context.next = 25;
              break;
            }

            letrasUsadas.push(index);
            salida.push(arrayFrases[j]);
            return _context.abrupt("break", 29);

          case 25:
            return _context.abrupt("continue", 26);

          case 26:
            i++;
            _context.next = 15;
            break;

          case 29:
            for (y = 0; y < letrasUsadas.length; y++) {
              letraUsada = letrasUsadas[y];
              indiceLetras = matrizTexto.indexOf(letraUsada);

              if (indiceLetras > -1) {
                matrizTexto.splice(indiceLetras, 1);
              }
            }

          case 30:
            j++;
            _context.next = 10;
            break;

          case 33:
            res.json({
              data: salida
            });

          case 34:
            _context.next = 40;
            break;

          case 36:
            _context.prev = 36;
            _context.t0 = _context["catch"](1);
            console.log(_context.t0);
            res.status(500).json({
              msg: "ha ocurrido un error inesperado",
              data: {}
            });

          case 40:
          case "end":
            return _context.stop();
        }
      }
    }, _callee, null, [[1, 36]]);
  }));
  return _encontrarFrases.apply(this, arguments);
}