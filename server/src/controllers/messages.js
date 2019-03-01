/*
  Ejercicio del día
  =================

  Se agrega una tabla 'Mensajeadores' que usamos como almacenamiento para les usuaries y
  la tabla 'mensajes' ahora solo hace referencia a 'id_mensajeador' (PK) que está en la otra tabla

    1. Status code en las peticiones
      A. Devolver un 500 siempre que haya un error
      con un objeto que solo tenga una propiedad message describiendo que pasó (error.message)

      B. Devolver un 404 si la petición no tuvo error pero rows === 0
      con un objeto que solo tenga una propiedad reason describiendo que pasó (empty result)

      C. Devolver un 200 si terminó bien con la información solicitada

    2. Usar queryParams para modificar el set de resultados de una petición. Recordar que los
    filtros son opcionales y acumulables

      A. Permitir ordenar los mensajes por fecha (ASC y DESC)
      Ejemplo: http://localhost:4000/mensajes?fecha=DESC

      B. Permitir filtrar los mensajes por user_name (cualquier coincidencia de texto)
      Ejemplo: http://localhost:4000/mensajes?userName=Cr
      Debería buscar todos los mensajes cuyo user_name empiece con 'Cr'

    3. Aplicar un alta anidando consultas

      A. Al agregar un mensaje, primero obtener el id del mensajeador según su nombre.
      Si no existe, hacer el insert.

      B. Agregar el mensaje usando el id del mensajeador.
*/

const db = require('../db');


async function addMessage(req, res) {
	const mensajeador = req.body.user_name;

	const queryExisteMensajeador = `
		SELECT id
		FROM mensajeadores
		WHERE nombre = '${mensajeador}';
	`;

	try {
		const idMensajeadorUnformated = await queryDB(queryExisteMensajeador);
		let idMensajeador;

		if (idMensajeadorUnformated.length !== 0) {

			idMensajeador = idMensajeadorUnformated[0].id;

		} else {
			const queryCrearMensajeador = `INSERT INTO mensajeadores (nombre)
																			VALUES ('${mensajeador}');`

			const rows = await queryDB(queryCrearMensajeador);
			
			idMensajeador = rows.insertId;
		}
				
		const queryEnviarMensaje = `INSERT INTO mensajes (mensaje, id_mensajeador, fecha)
		VALUES ('${req.body.message}', ${idMensajeador}, NOW());`
		
		const rows = await queryDB(queryEnviarMensaje);
				
		respuesta(rows, res);
						
	} catch (error) {
			console.log(error);
			respuestaError(error, res);
	}
}

function deleteMessage(req, res) {
	const query = `DELETE FROM mensajes WHERE id = ${req.params.id}`;

	sendResponse(query, res);
}

function editMessage(req, res) {
	const query = `UPDATE mensajes
								SET mensaje = ${req.body.message}
								WHERE id = ${req.params.id}`;

	sendResponse(query, res);
}

function listMessages(req, res) {
	var query = `
  SELECT mensajes.id, mensaje, nombre AS user_name, fecha
  FROM mensajes
  JOIN mensajeadores ON mensajes.id_mensajeador = mensajeadores.id
  `;

	if (req.query.userName) {
		query += `
    WHERE nombre LIKE  '${req.query.userName}%'
    `;
	}

	if (req.query.fecha) {
		query += `
			ORDER BY fecha ${req.query.fecha}
		`;
	}

	sendResponse(query, res);
}

function respuesta(rows, res) {
	if (rows === 0) {
		res.status(404);

		res.send({
			reason: 'empty result'
		});

	} else {
		res.send(rows);
	}
}

function respuestaError(error, res) {
	res.status(500);
	
	res.send({
		message: error.message
	});
}

async function sendResponse(query, res) {
	try {
		const rows = await queryDB(query);

		respuesta(rows, res);
	} catch (error) {
		respuestaError(error, res);
	}
}


function queryDB(queryStr) {
	return new Promise(function (resolve, reject) {
		
		db.query(queryStr, function(error, rows) {
			
			if (error) {
				reject(error);
				
			} else {
				resolve(rows);
				
			}
		})
	})
}

module.exports = {
	add: addMessage,
	delete: deleteMessage,
	edit: editMessage,
	list: listMessages,
	queryDB : queryDB
};