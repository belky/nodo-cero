"NODO CERO" by "VampireBBS".

[================================================================
  NODO CERO — Acto I: La Caverna
  © 2026 VampireBBS / Vampsecure Studios

  PARA COMPILAR (Glulx / .ulx):
	ni --format=Inform6/32 --project nodo_cero.inform
	inform6 -G -E2 -~S output.inf nodo_cero.ulx
  Usa siempre Glulx. SpanishLanguageKit no es compatible con Z-machine.

  GÉNERO: Thriller / Misterio / Hacker
  DIFICULTAD: Media · Acto I de IV
  VERSIÓN: 0.1-acto1 (desarrollo)
  COMPATIBILIDAD: Inform 7 10.1.2

  Madrid, octubre de 1994. Son las 23:15.
  El módem acaba de recibir un paquete FidoNet
  de un nodo que lleva tres años muerto.

  ESTRUCTURA DE PUNTUACIÓN (Acto I / 250 pts de 1000):
	+ 20  Leer el mensaje de El_Fantasma
	+ 30  Examinar la cabecera de enrutamiento
	+ 30  Verificar el nodo 2:341/199 en la libreta
	+ 30  Encontrar el historial de actividad en FIDO.LOG
	+ 20  Recuperar la contraseña de sesión (NODECFG.SYS)
	+ 50  Establecer contacto con Netrunner_68k
	+ 70  Descubrir las KLUDGE lines (fragmento 2 + dead drop)
================================================================]

[=== SOPORTE ESPAÑOL — verbos, direcciones y TODOS los mensajes del sistema ===]

[-- Direcciones --]
Understand "norte" as north. Understand "n" as north.
Understand "sur" as south.   Understand "s" as south.
Understand "este" as east.   Understand "e" as east.
Understand "oeste" as west.  Understand "o" as west.
Understand "arriba" and "subir" as up.
Understand "abajo" and "bajar" as down.

[-- Verbos --]
Understand "coger [something]" and "tomar [something]" and "agarrar [something]" as taking.
Understand "dejar [something]" and "soltar [something]" as dropping.
Understand "examinar [something]" and "ex [something]" as examining.
Understand "mirar" as looking.
Understand "inventario" and "inv" as taking inventory.
Understand "puntuacion" and "puntuación" and "puntos" as requesting the score.
Understand "esperar" as waiting.
Understand "abrir [something]" as opening.
Understand "cerrar [something]" as closing.

[-- Mensajes de acciones — reglas Report/Check --]
Report taking something: say "Cogido."; rule succeeds.
Report dropping something: say "Dejado."; rule succeeds.
The standard report waiting rule does nothing.
Report waiting: say "El tiempo pasa."
Report opening something: say "Abierto."; rule succeeds.
Report closing something: say "Cerrado."; rule succeeds.

Instead of taking something when the player carries the noun:
	say "Ya lo llevas."
Check taking something when the noun is scenery:
	say "Eso es parte del escenario."; stop the action.
Check taking something when the noun is fixed in place:
	say "No puedes moverlo: está fijo."; stop the action.
Check dropping something when the player does not carry the noun:
	say "No lo llevas encima."; stop the action.
Check opening something when the noun is open:
	say "Ya está abierto."; stop the action.
Check closing something when the noun is closed:
	say "Ya está cerrado."; stop the action.

[-- No puedes ir por ahí --]
Instead of going nowhere:
	say "No puedes ir por ahí."

[-- Examinar al jugador --]
Instead of examining the player:
	say "Estás en pijama y llevas zapatillas de casa. Son casi las once y media de la noche."

[-- Objetos visibles en la sala — sustituye "You can see X here" por "X está aquí." --]
For printing a locale paragraph about a thing (called el_item):
	if el_item is scenery, rule fails;
	if el_item is the player, rule fails;
	say "[printed name of el_item] está aquí.[line break]";
	now el_item is mentioned;
	rule succeeds.

Rule for listing nondescript items of a room: do nothing instead.

[-- Inventario --]
Instead of taking inventory:
	if nothing is carried by the player:
		say "No llevas nada.";
	else:
		say "Llevas:[line break]";
		repeat with objeto running through things carried by the player:
			say "  [printed name of objeto][line break]".

[-- Puntuación --]
The announce the score rule does nothing.
Report requesting the score:
	say "Puntuación: [score]/[maximum score] puntos ([turn count] turno[if turn count is 1][else]s[end if])."

[-- Errores de parser --]
Rule for printing a parser error when the latest parser error is the I beg your pardon error:
	say "No te he entendido." instead.
Rule for printing a parser error when the latest parser error is the didn't understand error:
	say "Comando no reconocido." instead.
Rule for printing a parser error when the latest parser error is the only understood as far as error:
	say "Solo he entendido parte de ese comando." instead.
Rule for printing a parser error when the latest parser error is the not a verb I recognise error:
	say "Ese verbo no lo reconozco." instead.
Rule for printing a parser error when the latest parser error is the can't see any such thing error:
	say "No veo eso por aquí." instead.
Rule for printing a parser error when the latest parser error is the said too little error:
	say "Necesito saber a qué te refieres." instead.

[=== CONFIGURACIÓN ===]
Use scoring. The maximum score is 1000.
The story headline is "Una aventura de ficción interactiva".
The story genre is "Mystery".
The story creation year is 2026.
The story description is "Madrid, 1994. Un mensaje imposible llega de un nodo muerto. Alguien murió para enviarlo.".

[=== REGIONES ===]
El mundo fisico is a region.
El mundo digital is a region.

[=== ESTADO GLOBAL ===]
Conectado is a truth state that varies. Conectado is false.
Modem-activo is a truth state that varies. Modem-activo is false.
Mensaje-leido is a truth state that varies. Mensaje-leido is false.
Cabecera-examinada is a truth state that varies. Cabecera-examinada is false.
Nodo-investigado is a truth state that varies. Nodo-investigado is false.
Log-encontrado is a truth state that varies. Log-encontrado is false.
Contrasena-encontrada is a truth state that varies. Contrasena-encontrada is false.
Netrunner-contactado is a truth state that varies. Netrunner-contactado is false.
Kludge-descubierto is a truth state that varies. Kludge-descubierto is false.
Diskette-insertado is a truth state that varies. Diskette-insertado is false.
Archivo-cargado is a truth state that varies. Archivo-cargado is false.
Respuesta-netrunner is a truth state that varies. Respuesta-netrunner is false.
Acto-1-completo is a truth state that varies. Acto-1-completo is false.
Virus32-dio-pista is a truth state that varies. Virus32-dio-pista is false.
Turnos-tras-netmail is a number that varies. Turnos-tras-netmail is 0.

[--- Acto II ---]
Acto-2-completo is a truth state that varies. Acto-2-completo is false.
Portal-visitado is a truth state that varies. Portal-visitado is false.
Ropa-puesta is a truth state that varies. Ropa-puesta is false.
Dead-drop-encontrado is a truth state that varies. Dead-drop-encontrado is false.
Sobre-leido is a truth state that varies. Sobre-leido is false.
Foto-examinada is a truth state that varies. Foto-examinada is false.
Mordor-conectado is a truth state that varies. Mordor-conectado is false.
Torquemada-fase is a number that varies. Torquemada-fase is 0.
Fragmento4-obtenido is a truth state that varies. Fragmento4-obtenido is false.

[=== ACCIONES PERSONALIZADAS ===]

Connecting is an action applying to nothing.
Understand "conectar" and "iniciar sesion" and "iniciar sesión" and "encender terminal" and "usar terminal" and "entrar en bbs" and "entrar bbs" as connecting.

Understand "adentro" and "dentro" as inside.

Disconnecting is an action applying to nothing.
Understand "desconectar" and "cerrar sesion" and "cerrar sesión" and "colgar" and "salir de bbs" as disconnecting.

Reading is an action applying to one thing.
Understand "leer [something]" and "consultar [something]" and "lee [something]" as reading.

Talking to is an action applying to one thing.
Understand "hablar con [something]" and "habla con [something]" and "hablar a [something]" as talking to.

Inserting-diskette is an action applying to one thing.
Understand "insertar [something]" and "cargar [something]" and "meter [something] en lectora" and "poner [something] en lectora" as inserting-diskette.

Loading-archive is an action applying to nothing.
Understand "cargar archivo" and "montar diskette" and "montar archivo" and "cargar diskette" as loading-archive.

Listing-files is an action applying to nothing.
Understand "listar ficheros" and "listar archivos" and "dir" and "ver ficheros" and "ver archivos" and "ls" as listing-files.

Examining-header is an action applying to one thing.
Understand "examinar cabecera [something]" and "ver cabecera [something]" and "leer cabecera [something]" as examining-header.

Examining-kludge is an action applying to one thing.
Understand "examinar kludge [something]" and "ver kludge [something]" and "kludge [something]" and "leer kludge [something]" and "cabecera binaria [something]" and "ver binario [something]" as examining-kludge.

Node-search-199 is an action applying to nothing.
Understand "buscar nodo 199" and "buscar 199" and "verificar 199" and "buscar el fantasma" and "nodo 199" as node-search-199.

Node-search-56 is an action applying to nothing.
Understand "buscar nodo 56" and "buscar 56" and "buscar mordor" and "nodo 56" as node-search-56.

Node-search-66 is an action applying to nothing.
Understand "buscar nodo 66" and "buscar 66" and "buscar netrunner" and "nodo 66" as node-search-66.

Writing-to-netrunner is an action applying to nothing.
Understand "escribir netmail a netrunner" and "escribir a netrunner" and "contactar netrunner" and "enviar mensaje a netrunner" and "escribir netmail" as writing-to-netrunner.

Reading-fido-log is an action applying to nothing.
Understand "leer fido log" and "ver fido log" and "leer fido" and "cat fido" as reading-fido-log.

Reading-nodecfg is an action applying to nothing.
Understand "leer nodecfg" and "ver nodecfg" and "leer node config" as reading-nodecfg.

Reading-baja-199 is an action applying to nothing.
Understand "leer baja 199" and "ver baja 199" and "leer baja" as reading-baja-199.

Asking-for-help is an action applying to nothing.
Understand "ayuda" and "help" and "comandos" and "ayudar" as asking-for-help.

Getting-dressed is an action applying to nothing.
Understand "vestirse" and "ponerse ropa" and "cambiarme" and "ponerme ropa" and "ponerme algo" as getting-dressed.

Searching-mailbox is an action applying to nothing.
Understand "registrar buzon" and "buscar buzon" and "registrar buzones" and "buscar detras del buzon" and "buscar bajo b" and "registrar bajo b" and "buscar sobre" as searching-mailbox.

Dialing-mordor is an action applying to nothing.
Understand "conectar mordor" and "llamar mordor" and "marcar mordor" and "conectar a mordor" and "llamar a mordor" and "marcar 983" and "conectar mordor bbs" as dialing-mordor.

[================================================================
  MUNDO FÍSICO — APARTAMENTO Y CALLE
================================================================]

[--- TU CUARTO ---]

Tu cuarto is a room in el mundo fisico.
The printed name of Tu cuarto is "Tu cuarto / Caverna-7 HQ".
The description of Tu cuarto is "El cuarto huele a cigarrillos fríos y a aire de equipo encendido desde hace horas. La pantalla Philips de 14 pulgadas tira su luz verde-blanca sobre la mesa de trabajo, donde el terminal lleva encendido desde las seis de la tarde. A la derecha, la cadena de música con el casete de los Pixies a medias. La cama sin hacer ocupa la esquina izquierda.[paragraph break][if modem-activo is true]La luz CARR del módem parpadea en verde: hay conexión activa.[else]El módem acaba de emitir un pitido corto y ha vuelto al silencio. La señal de que has recibido un paquete FidoNet.[end if][paragraph break]El pasillo está al norte.".

The terminal is a fixed in place supporter in Tu cuarto.
The description of the terminal is "Un 486 DX2 a 66 MHz con 8 MB de RAM y 420 MB de disco duro. La pantalla muestra el prompt de DOS: [bold type]C:\CAVERNA>[roman type][paragraph break]Desde aquí llevas cuatro años corriendo Caverna-7: una de las treinta y tantas BBSes de Madrid, especializada en seguridad informática y la escena underground española. Tienes doce usuarios registrados.[if diskette-insertado is true][paragraph break]La lectora de 3½ tiene el diskette FIDO-ARCH 91 insertado.[end if]".
The terminal is scenery.
Understand "terminal" and "ordenador" and "pc" and "486" and "pantalla" and "monitor" as the terminal.

The modem is a fixed in place thing in Tu cuarto.
The description of the modem is "Un US Robotics Sportster a 9600 baudios. La caja de plástico beige con cuatro luces: PWR (verde), MR (verde), CARR ([if modem-activo is true]verde, conexión activa[else]apagada[end if]) y CD ([if diskette-insertado is true]encendida[else]apagada[end if]).".
The modem is scenery.
Understand "modem" and "módem" and "us robotics" and "sportster" as the modem.

The libreta-azul is a thing in Tu cuarto.
The printed name of the libreta-azul is "libreta azul".
Understand "libreta" and "libreta azul" and "agenda" and "nodos" and "cuaderno" as the libreta-azul.
The description of the libreta-azul is "Una libreta Quo Vadis de tapas azules llena de apuntes a bolígrafo. Cuatro años de anotaciones sobre nodos FidoNet con los que has tenido contacto.[paragraph break]La última entrada es la única tachada, con trazo más grueso:[paragraph break][fixed letter spacing]  2:341/199 · CAVERNA-0 · Madrid[line break]  sysop: El_Fantasma · TEL: 91-447-XXXX[line break]  [bold type]CAÍDO — oct 91. Murió el sysop. Accidente.[roman type][line break]  [italic type]Netrunner confirmó la baja nov/91. Eliminado.[roman type][variable letter spacing]".

The caja-diskettes is a container in Tu cuarto.
The printed name of the caja-diskettes is "caja de diskettes".
Understand "caja" and "diskettes" and "disquetes" and "diskette" and "disquete" and "caja diskettes" and "cajon" as the caja-diskettes.
The description of the caja-diskettes is "Una caja de cartón con la pegatina '[fixed letter spacing]BACKUPS 90-93[variable letter spacing]'. Dentro hay una quincena de diskettes de 3½ con etiquetas escritas a mano. El de rotulador rojo es el que buscas.".

The diskette-fido is a thing in the caja-diskettes.
The printed name of the diskette-fido is "diskette 'FIDO-ARCH 91'".
Understand "diskette fido" and "fido arch" and "fidoarchive" and "disco fido" and "disquete fido" and "fido 91" and "fido-arch" and "diskette rojo" and "disquete rojo" as the diskette-fido.
The description of the diskette-fido is "Un diskette de 3½ con la etiqueta en rotulador rojo: [bold type]FIDO-ARCH 91 — logs + config[roman type]. Tiene el botón de protección de escritura puesto. Contiene los ficheros de configuración y los logs de actividad de Caverna-7 como nodo FidoNet durante todo el año 1991 — incluyendo octubre y noviembre.".

The tarjeta-telefono is a thing in Tu cuarto.
The printed name of the tarjeta-telefono is "tarjeta telefónica".
Understand "tarjeta" and "tarjeta telefonica" and "tarjeta telefónica" and "telefónica" as the tarjeta-telefono.
The description of the tarjeta-telefono is "Una tarjeta prepago de Telefónica. Saldo para unas diez llamadas locales o tres de larga distancia. Útil si necesitas usar la cabina de la calle.".

The cenicero is a scenery thing in Tu cuarto.
Understand "cenicero" as the cenicero.
The description of the cenicero is "Lleno. Hace tres días que no lo vacías. Los Ducados aplastados llevan la cuenta.".

[--- PASILLO ---]

El pasillo is a room in el mundo fisico.
The printed name of El pasillo is "Pasillo".
The description of El pasillo is "Un pasillo estrecho con estanterías de madera hasta el techo: libros técnicos, el Kernighan & Ritchie en tres volúmenes, PCWorld desde el 88, Micromanía completa desde el número 1. Enterrada entre las revistas, una colección de PHRACK hasta el número 47. Abajo, en el estante más bajo, la Guía Telefónica de Madrid.[paragraph break]Tu cuarto queda al sur. El salón, al oeste. La escalera, al norte.".
El pasillo is north of Tu cuarto.

The guia-telefonica is a thing in El pasillo.
The printed name of the guia-telefonica is "Guía Telefónica de Madrid".
Understand "guia" and "guía" and "guia telefonica" and "directorio" and "paginas blancas" and "páginas blancas" and "telefonica" as the guia-telefonica.
The description of the guia-telefonica is "La Guía Telefónica de Madrid, edición 1993. Dos tomos de papel de biblia, letras diminutas, un olor a tinta un poco rancia.[if nodo-investigado is true][paragraph break]En las páginas blancas, bajo el nombre completo del sysop de 2:341/199 — Carlos Mendoza García — hay una dirección en Lavapiés y un número que ya no existe. Junto a la entrada, a lápiz: [bold type]† oct 91[roman type].[end if]".

[--- SALÓN ---]

El salon is a room in el mundo fisico.
The printed name of El salon is "Salón".
The description of El salon is "Un salón de piso de los setenta con muebles de los ochenta. La tele Sony de 21 pulgadas tiene el Telediario a volumen bajo. Sofá de skay marrón, mesa de café con el ABC de esta mañana. Tu madre está en el sofá con el albornoz puesto.[paragraph break]La cocina queda al norte. El pasillo al este.".
El salon is west of El pasillo.

La madre is a woman in El salon.
The printed name of La madre is "tu madre".
Understand "madre" and "consuelo" and "mama" and "mamá" as La madre.
The description of La madre is "Consuelo. Tiene cara de llevar un rato dormitando en el sofá antes de que el pitido del módem la despertara.".

Instead of talking to La madre:
	say "Tu madre levanta la vista.[paragraph break]'¿Qué es ese ruido que hace la máquina esa?'[paragraph break]'El módem, mamá. Ha recibido datos.'[paragraph break]'¿A estas horas?'[paragraph break]Decides no explicar el concepto de BBS.[paragraph break]'Sí,' dices. 'A estas horas.' ".

The tele is a fixed in place thing in El salon.
The description of the tele is "El Telediario de las 23:00. Una pieza sobre el avance de Internet en Estados Unidos: 'la red de redes que conecta millones de ordenadores'. El presentador pronuncia 'Internet' con acento en la primera e.".
The tele is scenery.
Understand "tele" and "television" and "televisión" and "televisor" and "sony" as the tele.

[--- COCINA ---]

La cocina is a room in el mundo fisico.
The printed name of La cocina is "Cocina".
The description of La cocina is "Una cocina estrecha con azulejos blancos. En la encimera: un paquete de Ducados, una cafetera italiana y tres tazas sin fregar. La nevera zumba. El salón queda al sur.".
La cocina is north of El salon.

The paquete-ducados is a thing in La cocina.
The printed name of the paquete-ducados is "paquete de Ducados".
Understand "ducados" and "cigarrillos" and "tabaco" and "paquete" and "cigarrillo" and "cigarros" as the paquete-ducados.
The description of the paquete-ducados is "Ducados negros sin filtro. Quedan cuatro. Esta noche van a hacer falta.".

Instead of taking the paquete-ducados:
	if the paquete-ducados is carried by the player:
		say "Ya los llevas.";
	else:
		now the paquete-ducados is carried by the player;
		say "Los coges. Unos Ducados no vendrán mal.".

[--- ESCALERA Y CALLE ---]

La escalera is a room in el mundo fisico.
The printed name of La escalera is "Escalera del edificio".
The description of La escalera is "La escalera de vecinos. Baldosas hexagonales de los años cuarenta. La bombilla del rellano parpadea un poco. Cuarto piso — tu piso — queda arriba. La calle está al sur.".
La escalera is north of El pasillo.

La calle is a room in el mundo fisico.
The printed name of La calle is "Calle de los Relatores".
The description of La calle is "Las once de la noche. Calle de los Relatores, entre Tirso de Molina y el Rastro. El frío de octubre moja el asfalto. Hay una cabina telefónica Telefónica en la esquina — de las verdes, modelo antiguo. La entrada al edificio queda al norte.[paragraph break]El bar de la esquina tiene la persiana a medias. Algún coche pasa de vez en cuando. Hace frío para estar en pijama.[if Acto-1-completo is true][paragraph break]Al sur sigue Lavapiés. A diez minutos andando, la calle Embajadores.[end if]".
La calle is south of La escalera.

The cabina is a fixed in place thing in La calle.
The printed name of the cabina is "cabina telefónica".
Understand "cabina" and "telefono" and "teléfono" and "cabina telefonica" as the cabina.
The description of the cabina is "Una cabina verde de Telefónica. De las de monedas o tarjeta. Si necesitaras llamar a alguien fuera de la red — una llamada de voz, no FidoNet — la tarjeta telefónica te daría para un par de llamadas de larga distancia.".

Instead of going outside when the player is in La calle:
	say "Estás en la calle. ¿Adónde irías a estas horas y en pijama?".

[================================================================
  MUNDO DIGITAL — CAVERNA-7 BBS
================================================================]

[--- BIENVENIDA ---]

C7-bienvenida is a room in el mundo digital.
The printed name of C7-bienvenida is "Caverna-7 :: Bienvenida".
The description of C7-bienvenida is "[fixed letter spacing]+==========================================================+[line break]|  CAVERNA-7 BBS  ·  Madrid  ·  FidoNet 2:341/202          |[line break]|  SysOp: Belky  ·  9600 bps  ·  ZModem  ·  HST            |[line break]|  [italic type]'La oscuridad tiene sus propios habitantes'[roman type]             |[line break]+==========================================================+[line break]|  Usuarios en línea: 2  ·  Último acceso: hoy 19:34       |[line break]+==========================================================+[variable letter spacing][paragraph break][if mensaje-leido is false][bold type]* TIENES CORREO NUEVO: 1 mensaje sin leer.[roman type][paragraph break][end if][if respuesta-netrunner is true][bold type]* CORREO NUEVO: 1 mensaje sin leer.[roman type][paragraph break][end if]Menú principal: Mensajes al norte · Correo al este · Ficheros al sur.[if diskette-insertado is true][paragraph break][italic type]Diskette FIDO-ARCH 91 en lectora. Cárgalo en Ficheros.[end if]".

[--- MENSAJES ---]

C7-mensajes is a room in el mundo digital.
The printed name of C7-mensajes is "Caverna-7 :: Tablón de Mensajes".
The description of C7-mensajes is "El tablón de Caverna-7. Cinco áreas: /security, /phreaking, /demos, /warez, /general.[paragraph break][fixed letter spacing]Actividad reciente:[line break]  VIRUS_32     hace 18 min    /security: 'Trucos BIOS AMI Award'[line break]  ZeroKool     hace 2 horas   /phreaking: 'Prefijos sin cobro'[line break]  El_Errante   hace 4 horas   /warez: 'Scene española, ¿hay alguien?'[variable letter spacing][paragraph break]VIRUS_32 está conectado ahora mismo.[paragraph break]Bienvenida al sur.".
C7-mensajes is north of C7-bienvenida.

[--- NPC: VIRUS_32 ---]

VIRUS-32 is a person in C7-mensajes.
The printed name of VIRUS-32 is "VIRUS_32".
Understand "virus" and "virus_32" and "virus32" as VIRUS-32.
The description of VIRUS-32 is "Un handle habitual de Caverna-7. En cuatro años nunca os habéis visto en persona. Trabaja en hardware, tiene acceso a las BIOS de muchos equipos. Sus posts son técnicos y precisos.".

Instead of talking to VIRUS-32:
	if mensaje-leido is false:
		say "VIRUS_32 levanta la vista del hilo que está escribiendo.[paragraph break]'Sysop. Oye, acabo de ver que tienes correo nuevo. De un nodo que no reconocí.' Pausa. '¿Quién era?'[paragraph break]'Todavía no lo he leído,' dices.[paragraph break]'Pues léelo. Tenía un FROM raro.'";
	else if cabecera-examinada is false:
		say "'¿2:341/199? Ese nodo lleva muerto desde el 91.' VIRUS_32 deja de teclear un momento. 'Lo sé porque solía hacer echo con ellos. El sysop murió en un accidente.' Pausa. 'La cabecera completa del mensaje, ¿la has visto? La ruta de enrutamiento. EXAMINAR CABECERA MENSAJE.'";
	else if virus32-dio-pista is false:
		now virus32-dio-pista is true;
		say "VIRUS_32 teclea despacio, como eligiendo las palabras.[paragraph break]'El mensaje tiene cabecera extendida. Las líneas de control. Las que los lectores normales ocultan.' Pausa. 'En FidoNet se llaman KLUDGE lines. Empiezan con un byte SOH — el 0x01. No se imprimen, pero están ahí, en el binario del paquete. Cualquier implementación de FrontDoor las incluye en el PKT.' Otro silencio. '¿Las has mirado?'[paragraph break]No las has mirado. EXAMINAR KLUDGE MENSAJE para verlas.";
	else:
		say "VIRUS_32 está quieto, esperando.[paragraph break]'EXAMINAR KLUDGE MENSAJE,' repite. 'El mensaje que recibiste. Las líneas de control ocultas.' ".

[--- NPC: ZEROKOOL ---]

ZeroKool is a person in C7-bienvenida.
Understand "zerokool" and "zero" and "kool" and "zero kool" as ZeroKool.
The description of ZeroKool is "Regular de Caverna-7. Más joven y más bullicioso que VIRUS_32. Especialidad: phreaking y las trampas de la RDSI.".

Instead of talking to ZeroKool:
	if mensaje-leido is false:
		say "'Ey, sysop,' escribe ZeroKool. '¿Algún problema con la BBS?'[paragraph break]'He recibido un paquete raro,' dices.[paragraph break]'¿Raro cómo?'[paragraph break]'De un nodo caído.'[paragraph break]Diez segundos de silencio. Luego: 'Eso no puede pasar.'[paragraph break]'Aparentemente sí puede.' ";
	else:
		say "ZeroKool no responde enseguida. Cuando lo hace, son solo cuatro palabras:[paragraph break]'Ten cuidado, sysop.'".

[--- CORREO / FIDONET ---]

C7-correo is a room in el mundo digital.
The printed name of C7-correo is "Caverna-7 :: Correo / FidoNet".
The description of C7-correo is "La bandeja de correo. Netmails personales y echomail de FidoNet.[paragraph break][fixed letter spacing]Mensajes:[line break]  [if mensaje-leido is false][bold type]1[roman type]  DE: El_Fantasma@2:341/199  ASUNTO: (sin asunto)  [bold type]* NUEVO[roman type][else]1  DE: El_Fantasma@2:341/199  ASUNTO: (sin asunto)[end if][if respuesta-netrunner is true][line break]  [bold type]2[roman type]  DE: Netrunner_68k@2:341/66  ASUNTO: Re: verificacion nodo  [bold type]* NUEVO[roman type][end if][variable letter spacing][paragraph break]LEER [bracket]número[close bracket] para abrir un mensaje. ESCRIBIR NETMAIL A [bracket]nodo[close bracket] para redactar.".
C7-correo is east of C7-bienvenida.

[--- EL MENSAJE IMPOSIBLE ---]

The mensaje-imposible is a fixed in place thing in C7-correo.
The printed name of the mensaje-imposible is "mensaje de El_Fantasma".
Understand "mensaje" and "correo" and "mail" and "netmail" and "1" and "mensaje 1" and "primer mensaje" and "mensaje el_fantasma" as the mensaje-imposible.
The description of the mensaje-imposible is "[if mensaje-leido is false]LEER MENSAJE para abrirlo.[else][fixed letter spacing]DE:    El_Fantasma@2:341/199[line break]PARA:  Belky@2:341/202[line break]FECHA: 23-OCT-1994 23:11:47[paragraph break]belky.[paragraph break]si esto llega es q la red ha tardado[line break]tres años en entregarlo. lo programe[line break]asi. sabes quien soy.[paragraph break]fragmento 1:[line break][bold type]QZMVR-NLLPX-08847-AATRE-09911[roman type][paragraph break]no busques al mensajero. busca[line break]el origen. 2:341/56.[variable letter spacing][end if]".

Instead of reading the mensaje-imposible:
	if mensaje-leido is true:
		say "Ya lo has leído.[paragraph break]EXAMINAR CABECERA MENSAJE · ver la ruta de enrutamiento completa[line break]EXAMINAR KLUDGE MENSAJE · ver las líneas de control ocultas en el binario";
	else:
		now mensaje-leido is true;
		increase the score by 20;
		say "[fixed letter spacing]--- NETMAIL #1 -------------------------------------------[line break]DE:    El_Fantasma@2:341/199[line break]PARA:  Belky@2:341/202[line break]FECHA: 23-OCT-1994 23:11:47[line break]---------------------------------------------------------[line break] [line break]belky.[line break] [line break]si esto llega es q la red ha tardado[line break]tres años en entregarlo. lo programe[line break]asi. sabes quien soy.[line break] [line break]fragmento 1:[line break][bold type]QZMVR-NLLPX-08847-AATRE-09911[roman type][line break] [line break]no busques al mensajero. busca[line break]el origen. 2:341/56.[line break] [line break]---------------------------------------------------------[variable letter spacing][paragraph break][italic type]El mensaje de El_Fantasma. 2:341/199 lleva tres años caído. El sysop murió en un accidente — tú mismo registraste la baja cuando Netrunner te lo comunicó.[roman type][paragraph break][bracket]+ 20 puntos: mensaje de un nodo muerto recibido y leído.[close bracket]".

[--- RESPUESTA DE NETRUNNER ---]

The respuesta-netrunner-msg is a fixed in place thing in C7-correo.
The printed name of the respuesta-netrunner-msg is "respuesta de Netrunner_68k".
Understand "mensaje 2" and "respuesta" and "respuesta netrunner" and "segundo mensaje" and "2" as the respuesta-netrunner-msg.

Instead of reading the respuesta-netrunner-msg:
	if respuesta-netrunner is false:
		say "Ese mensaje no existe todavía.";
	else:
		say "[fixed letter spacing]--- NETMAIL #2 -------------------------------------------[line break]DE:    Netrunner_68k@2:341/66[line break]PARA:  Belky@2:341/202[line break]FECHA: 23-OCT-1994 23:38:02[line break]---------------------------------------------------------[line break] [line break]Belky.[line break] [line break]El paquete entró en mi nodo el 24/11/91.[line break]Lo puse en HOLD porque el tuyo llevaba[line break]una semana sin recoger correo. Cuando[line break]volviste, el timeout de 30 días había[line break]pasado. El sistema lo archivó.[line break] [line break]Esta noche algo lo reactivó. No he[line break]sido yo.[line break] [line break]El nodo origen estaba formalmente muerto[line break]cuando entré el paquete. La fecha de[line break]creación es del 23/10/91 — un mes antes[line break]de la baja oficial.[line break] [line break]Habla con 2:341/56 (Mordor BBS,[line break]Valladolid). Por ahí pasó el paquete.[line break] [line break]Ten cuidado con lo que estás moviendo.[line break] [line break]-- Netrunner[variable letter spacing][paragraph break][italic type]El paquete estuvo archivado tres años en Alcalá de Henares. La fecha del paquete coincide con el día del accidente. El sysop generó el mensaje el día que murió.[roman type][paragraph break]Algo en la estructura del paquete todavía no has mirado. EXAMINAR KLUDGE MENSAJE para ver las líneas de control ocultas.".

[--- FICHEROS ---]

C7-ficheros is a room in el mundo digital.
The printed name of C7-ficheros is "Caverna-7 :: Ficheros".
The description of C7-ficheros is "El área de ficheros de Caverna-7.[paragraph break][fixed letter spacing]/utils      120 fich · herramientas generales[line break]/demos      43 fich · demoscene española[line break]/security   87 fich · seguridad y exploits[line break]/phreaking  29 fich · técnicas de phreaking[line break]/docs       64 fich · documentación técnica[if archivo-cargado is true][line break][bold type]/fido91     31 fich · Archivo FidoNet 1991 [bracket]DISKETTE[close bracket][roman type][end if][variable letter spacing][paragraph break][if diskette-insertado is true]El diskette FIDO-ARCH 91 está en la lectora. CARGAR ARCHIVO para montarlo.[end if][if archivo-cargado is true]El archivo de 1991 está disponible. LISTAR FICHEROS para ver el contenido o LEER [bracket]fichero[close bracket] para abrir uno.[end if][paragraph break]Bienvenida al norte.".
C7-ficheros is south of C7-bienvenida.

[================================================================
  REGLAS DE ACCIÓN — CONEXIÓN Y DESCONEXIÓN
================================================================]

Check connecting:
	if Conectado is true:
		say "Ya estás conectado a Caverna-7." instead;
	if the player is not in Tu cuarto:
		say "No estás frente al terminal." instead.

Carry out connecting:
	now Modem-activo is true;
	now Conectado is true;
	move the player to C7-bienvenida;
	say "[fixed letter spacing]ATDT91447XXXX...[line break]RING   RING[line break]CONNECT 9600[line break]----------------------------------------[variable letter spacing][paragraph break]El módem negocia el handshake y cede el control al software de BBS. En dos segundos estás dentro de Caverna-7.".

Check disconnecting:
	if Conectado is false:
		say "No estás conectado a ningún sistema." instead.

Carry out disconnecting:
	now Conectado is false;
	move the player to Tu cuarto;
	say "[fixed letter spacing]NO CARRIER[variable letter spacing][paragraph break]Te desconectas. La pantalla vuelve al prompt de DOS: [bold type]C:\CAVERNA>[roman type]".

Instead of going when Conectado is true and the noun is up:
	try disconnecting.

[================================================================
  REGLAS DE ACCIÓN — EXAMINAR CABECERA
================================================================]

Carry out examining-header:
	say "Especifica qué cabecera examinar: EXAMINAR CABECERA MENSAJE.".

Instead of examining-header the mensaje-imposible:
	if Mensaje-leido is false:
		say "Primero tienes que leer el mensaje. LEER MENSAJE." instead;
	if Cabecera-examinada is true:
		say "Ya la has examinado. Ruta: 2:341/199 → 2:341/56 → 2:341/66 → 2:341/202. El cuarto salto es de esta noche — reactivación." instead;
	now Cabecera-examinada is true;
	increase the score by 30;
	say "[fixed letter spacing]--- CABECERA TÉCNICA: NETMAIL #1 -------------------------[line break]MSGID: 2:341/199 5c3f9a01[line break]PID:   FrontDoor 2.12 ml[line break]INTL:  2:341/202 2:341/199[line break][bold type]VIA:   2:341/199  1991/10/23 23:09:00 UTC[line break]VIA:   2:341/56   1991/10/24 00:17:42 UTC[line break]VIA:   2:341/66   1991/10/24 01:03:11 UTC[line break]VIA:   2:341/66   1994/10/23 23:08:55 UTC  << REACTIVADO[roman type][variable letter spacing][paragraph break]La ruta original es 199 → 56 (Valladolid) → 66 (Alcalá de Henares, Netrunner) → tu nodo 202. Fecha del primer salto: octubre del 91.[paragraph break]Pero hay un cuarto VIA: el nodo 66 aparece dos veces. La segunda entrada es de hace quince minutos. El paquete estuvo archivado en 2:341/66 desde 1991 y esta noche algo lo reactivó y lo empujó hacia ti.[paragraph break][bracket]+ 30 puntos: ruta de enrutamiento mapeada. Tres años en el archivo de Netrunner.[close bracket]".

[================================================================
  REGLAS DE ACCIÓN — EXAMINAR KLUDGE
================================================================]

Carry out examining-kludge:
	say "Especifica qué examinar: EXAMINAR KLUDGE MENSAJE.".

Instead of examining-kludge the mensaje-imposible:
	if Mensaje-leido is false:
		say "Primero tienes que leer el mensaje. LEER MENSAJE." instead;
	if Kludge-descubierto is true:
		say "Ya lo has visto. Fragmento 2: XKNT9-00013-WWQAZ-LLORE-55519. Dead drop: Calle Embajadores 47, Bajo B. Sobre sellado." instead;
	now Kludge-descubierto is true;
	increase the score by 70;
	say "[fixed letter spacing]--- KLUDGE LINES (control, oculto en el binario PKT) -----[line break]\x01MSGID: 2:341/199 5c3f9a01[line break]\x01PID:   FrontDoor 2.12 ml[line break]\x01[bold type]FRAG2: XKNT9-00013-WWQAZ-LLORE-55519[roman type][line break]\x01[bold type]DATE:  1991-10-23[roman type][line break]\x01[bold type]DROP:  MADRID · CALLE EMBAJADORES 47 · BAJO B[roman type][line break]\x01[bold type]KEY:   EN EL SOBRE SELLADO[roman type][line break]\x01END[variable letter spacing][paragraph break]Tres datos que el lector de correo normal no muestra:[paragraph break]    [bold type]Fragmento 2:[roman type] XKNT9-00013-WWQAZ-LLORE-55519[line break]    [bold type]Fecha de origen:[roman type] 23 de octubre de 1991 — el día del accidente[line break]    [bold type]Dead drop:[roman type] Calle Embajadores 47, Bajo B, Madrid. Un sobre sellado.[paragraph break]El mensaje no es solo un mensaje. Es un mapa.[paragraph break][bracket]+ 70 puntos: fragmento 2 y localización del dead drop descubiertos.[close bracket]".

[================================================================
  REGLAS DE ACCIÓN — NODOS (búsqueda en libreta)
================================================================]

Carry out node-search-199:
	if Nodo-investigado is true:
		say "Ya lo has comprobado. 2:341/199: CAVERNA-0, Madrid, sysop El_Fantasma. Baja tramitada por Netrunner en nov/91. El nodo lleva tres años eliminado del nodelist.";
	else:
		now Nodo-investigado is true;
		increase the score by 30;
		say "Buscas 2:341/199 en la libreta azul.[paragraph break][fixed letter spacing]2:341/199 · CAVERNA-0 · Madrid[line break]sysop: El_Fantasma · TEL: 91-447-XXXX[line break][bold type]CAÍDO — oct 91. Murió el sysop. Accidente.[roman type][line break]Netrunner confirmó la baja nov/91. Eliminado del nodelist.[variable letter spacing][paragraph break]El sysop de 2:341/199 murió en octubre del 91 — tú mismo registraste su baja cuando Netrunner te lo comunicó. El nodo lleva tres años formalmente muerto.[paragraph break]Y esta noche te ha enviado un mensaje.[paragraph break][bracket]+ 30 puntos: identidad del nodo origen verificada.[close bracket]".

Carry out node-search-56:
	say "Buscas 2:341/56 en la libreta.[paragraph break][fixed letter spacing]2:341/56 · MORDOR BBS · Valladolid[line break]sysop: Torquemada · TEL: 983-XXX-XXX[line break]Operativo. Último contacto: hace 2 meses.[variable letter spacing][paragraph break]Mordor BBS sigue operativo en Valladolid. El sysop se llama Torquemada — solo le conoces por el handle. Por ese nodo pasó el paquete en 1991, según la cabecera. Allí hay que ir en el Acto II.".

Carry out node-search-66:
	say "Buscas 2:341/66 en la libreta.[paragraph break][fixed letter spacing]2:341/66 · DARKSIDE NET · Alcalá de Henares[line break]sysop: Netrunner_68k · TEL: 91-888-XXXX[line break]Tu nodo UPLINK. Llevas cuatro años con él.[variable letter spacing][paragraph break]Netrunner_68k es tu uplink desde el principio: el que recoge tu correo y lo distribuye al resto de la zona 2:341. Uno de los pocos sysops que conoces en persona.".

[================================================================
  REGLAS DE ACCIÓN — DISKETTE Y ARCHIVO
================================================================]

Instead of inserting-diskette the diskette-fido:
	if Diskette-insertado is true:
		say "El diskette ya está en la lectora.";
	else:
		now Diskette-insertado is true;
		say "Insertas el diskette FIDO-ARCH 91 en la lectora de 3½. La cabeza emite un clic. Desde Caverna-7, el archivo estará disponible en Ficheros una vez que lo montes con CARGAR ARCHIVO.".

Check loading-archive:
	if Diskette-insertado is false:
		say "No hay ningún diskette en la lectora. Busca el diskette FIDO-ARCH 91 en la caja de backups." instead;
	if Conectado is false:
		say "Conéctate primero a Caverna-7. CONECTAR." instead.

Carry out loading-archive:
	if Archivo-cargado is true:
		say "El archivo ya está montado. Disponible en /fido91 desde Ficheros.";
	else:
		now Archivo-cargado is true;
		say "[fixed letter spacing]Montando FIDO-ARCH 91...[line break]31 ficheros cargados en /fido91[variable letter spacing][paragraph break]El archivo de 1991 está montado. LISTAR FICHEROS para ver el contenido o LEER [bracket]fichero[close bracket] para abrirlo.".

Carry out listing-files:
	if Archivo-cargado is false:
		say "No hay ningún archivo cargado. Inserta el diskette FIDO-ARCH 91 y usa CARGAR ARCHIVO.";
	else if the player is not in C7-ficheros:
		say "El área de Ficheros queda al sur desde la Bienvenida.";
	else:
		say "[fixed letter spacing]DIR /fido91[line break]------------------------------------[line break]FIDO.LOG          43K    24-Nov-1991[line break]NODECFG.SYS        8K    15-Feb-1991[line break]ROUTING.LOG       12K    24-Nov-1991[line break]BAJA_199.TXT       2K    15-Nov-1991[line break]ECHO_1991.LOG     67K    31-Dec-1991[line break]NETLIST.91        18K    01-Nov-1991[line break]...  (25 ficheros más)[variable letter spacing][paragraph break]Los más relevantes parecen FIDO.LOG, NODECFG.SYS y BAJA_199.TXT.".

[================================================================
  REGLAS DE ACCIÓN — LECTURA DE FICHEROS DE ARCHIVO
================================================================]

Check reading-fido-log:
	if Archivo-cargado is false:
		say "El archivo no está cargado. Inserta el diskette FIDO-ARCH 91 y usa CARGAR ARCHIVO." instead.

Carry out reading-fido-log:
	if Log-encontrado is true:
		say "Ya lo has leído. El paquete de 2:341/199 llegó al nodo de Netrunner el 24/11/91, quedó en HOLD por timeout y fue archivado por un bug de FrontDoor 2.12.";
	else:
		now Log-encontrado is true;
		increase the score by 30;
		say "[fixed letter spacing]--- FIDO.LOG (extracto relevante) -----------------------[line break]1991-10-24 01:03  PKT recibido via 2:341/56[line break]                  FROM: 2:341/199  TO: 2:341/202[line break]                  Nodo destino UNREACHABLE (offline)[line break]                  Estado: HOLD (retener 30 días)[line break] [line break]1991-11-15 09:44  Solicitud de baja: nodo 2:341/199[line break]                  Motivo: [bold type]sysop fallecido[roman type][line break]                  Tramitada por: Netrunner_68k@2:341/66[line break]                  Estado: ELIMINADO del nodelist regional[line break] [line break]1991-11-24 09:44  PKT 2:341/199→2:341/202 en HOLD[line break]                  Timeout 30 días: [bold type]ARCHIVADO[roman type][line break]                  [italic type](debería haberse eliminado — bug FD 2.12)[roman type][variable letter spacing][paragraph break]El bug es la clave: FrontDoor 2.12 debería eliminar los paquetes que alcanzan el timeout de 30 días. No lo hizo. Los archivó en lugar de borrarlos.[paragraph break]El paquete lleva tres años en el archivo de Netrunner, esperando a que algo lo reactivara.[paragraph break][bracket]+ 30 puntos: historial del nodo 199 verificado.[close bracket]".

Check reading-nodecfg:
	if Archivo-cargado is false:
		say "El archivo no está cargado." instead.

Carry out reading-nodecfg:
	if Contrasena-encontrada is true:
		say "Ya lo has leído. Contraseña de sesión con 2:341/66: vampirobbs92. La configuraste en febrero del 92.";
	else:
		now Contrasena-encontrada is true;
		increase the score by 20;
		say "[fixed letter spacing]--- NODECFG.SYS ------------------------------------------[line break]NODE     = 2:341/202[line break]UPLINK   = 2:341/66      (Netrunner_68k)[line break]PASSWD   = [bold type]vampirobbs92[roman type]        ; contraseña de sesión[line break]SCHEDULE = 01:00,05:00,09:00,17:00,21:00[line break]POLL     = YES[line break]PKTSIZE  = 64000[variable letter spacing][paragraph break]La contraseña de sesión con tu uplink, de cuando configuraste el nodo en el 92. Netrunner_68k la acepta para autenticar netmails directos.[paragraph break][bracket]+ 20 puntos: contraseña de sesión FidoNet recuperada.[close bracket]".

Check reading-baja-199:
	if Archivo-cargado is false:
		say "El archivo no está cargado." instead.

Carry out reading-baja-199:
	say "[fixed letter spacing]--- BAJA_199.TXT -----------------------------------------[line break]Notificación de baja · Zona 2, Red 341[line break] [line break]Nodo:    2:341/199 (CAVERNA-0, Madrid)[line break]Sysop:   El_Fantasma (Carlos Mendoza García)[line break]Fecha:   15 de noviembre de 1991[line break]Motivo:  Fallecimiento del sysop (23 oct 1991)[line break]         Accidente de tráfico, Ctra. de la Coruña km.14[line break]Tramita: Netrunner_68k, ZC zona 2:341[variable letter spacing][paragraph break]El nombre real del sysop de 2:341/199 era Carlos Mendoza García. Murió el 23 de octubre de 1991 en la Carretera de la Coruña — el mismo día que aparece en las KLUDGE lines del mensaje.[paragraph break]No fue un accidente cualquiera. El mismo día que generó el mensaje.".

[================================================================
  REGLAS DE ACCIÓN — ESCRIBIR NETMAIL A NETRUNNER
================================================================]

Check writing-to-netrunner:
	if Conectado is false:
		say "Conéctate primero a Caverna-7. CONECTAR." instead;
	if the player is not in C7-correo:
		say "Ve al área de Correo (al este desde la Bienvenida)." instead;
	if Nodo-investigado is false:
		say "Todavía no tienes suficiente información para saber qué preguntarle. Investiga el nodo 2:341/199 primero." instead.

Carry out writing-to-netrunner:
	if Netrunner-contactado is true:
		say "Ya le has enviado el netmail. Espera su respuesta — tardará unos minutos.";
	else if Contrasena-encontrada is false:
		say "[fixed letter spacing]Conectando con 2:341/66...[line break]Autenticación requerida — contraseña de sesión no disponible.[variable letter spacing][paragraph break]Netrunner configuró su nodo para exigir autenticación en los netmails directos. Necesitas la contraseña de sesión de 1991-92. Estaba en los ficheros de configuración. ¿Tienes el diskette FIDO-ARCH 91?";
	else:
		now Netrunner-contactado is true;
		now Turnos-tras-netmail is 0;
		increase the score by 50;
		say "[fixed letter spacing]Conectando con 2:341/66...[line break]Autenticando con vampirobbs92...[line break]CONNECT 9600  ·  HANDSHAKE OK  ·  SESIÓN ESTABLECIDA[line break] [line break]Escribes:[line break] [line break]Netrunner —[line break]Esta noche he recibido un paquete de 2:341/199.[line break]Ese nodo lleva tres años caído. La cabecera[line break]muestra que pasó por ti en el 91 y quedó en HOLD.[line break]¿Sabes algo de esto?[line break] [line break]— Belky, 2:341/202[line break] [line break]ENVIADO · respuesta en próximo poll...[variable letter spacing][paragraph break][bracket]+ 50 puntos: contacto establecido con Netrunner_68k.[close bracket][paragraph break][italic type]Netrunner responderá en unos minutos. Puedes desconectarte y hacer otras cosas — cuando vuelvas, el correo te estará esperando.[roman type]".

[================================================================
  SISTEMA DE TIEMPO — RESPUESTA DE NETRUNNER
================================================================]

Every turn when Netrunner-contactado is true and Respuesta-netrunner is false:
	increment Turnos-tras-netmail;
	if Turnos-tras-netmail >= 4:
		now Respuesta-netrunner is true;
		if the player is in el mundo digital:
			say "[bracket]Pitido del sistema: correo nuevo entrante.[close bracket][paragraph break][fixed letter spacing]NETMAIL RECIBIDO · DE: Netrunner_68k@2:341/66[variable letter spacing][paragraph break]Ve al área de Correo para leer la respuesta.".

[================================================================
  DETECCIÓN DE FIN DE ACTO I
================================================================]

Every turn when Kludge-descubierto is true and Acto-1-completo is false:
	now Acto-1-completo is true;
	say "[line break]----------------------------------------------------------[paragraph break]Tienes dos fragmentos cifrados, una dirección física en Madrid y la confirmación de Netrunner: el paquete llevaba tres años archivado en Alcalá de Henares y alguien lo reactivó esta noche.[paragraph break]Carlos Mendoza García — El_Fantasma — murió el 23 de octubre de 1991 en la carretera de La Coruña. El mismo día que generó el mensaje. Lo programó sabiendo que iba a morir.[paragraph break]El dead drop está en Calle Embajadores 47, Bajo B. A diez minutos caminando desde aquí.[paragraph break]Y el nodo 2:341/56 — Mordor BBS, Valladolid — es el siguiente punto de la ruta.[paragraph break][bold type]===================================================[roman type][paragraph break][bold type]   FIN DEL ACTO I — LA CAVERNA[roman type][paragraph break][bold type]===================================================[roman type][paragraph break][italic type]Acto II: La Red. Seis nodos. Seis fragmentos del mensaje. Seis personas que no quieren que los encuentres.[roman type]".

[================================================================
  AYUDA
================================================================]

Carry out asking-for-help:
	say "[fixed letter spacing]+==========================================================+[line break]|  NODO CERO — Comandos principales                        |[line break]+==========================================================+[line break]|  CONECTAR / DESCONECTAR  · entrar o salir de Caverna-7   |[line break]|  LEER [bracket]objeto[close bracket]           · leer mensajes y documentos    |[line break]|  EXAMINAR CABECERA [bracket]msg[close bracket] · cabecera técnica de un mensaje |[line break]|  EXAMINAR KLUDGE [bracket]msg[close bracket]   · líneas de control ocultas     |[line break]|  BUSCAR NODO [bracket]dirección[close bracket] · consultar libreta de nodos    |[line break]|  INSERTAR [bracket]diskette[close bracket]     · cargar diskette en lectora    |[line break]|  CARGAR ARCHIVO          · montar diskette en Ficheros   |[line break]|  LISTAR FICHEROS / DIR   · ver contenido del archivo     |[line break]|  LEER FIDO.LOG           · log de actividad FidoNet 1991 |[line break]|  LEER NODECFG.SYS        · configuración del nodo        |[line break]|  ESCRIBIR NETMAIL A [bracket]...[close bracket] · enviar correo a otro nodo    |[line break]|  HABLAR CON [bracket]persona[close bracket]    · hablar con un NPC             |[line break]+==========================================================+[line break]|  N · S · E · O / NORTE · SUR · ESTE · OESTE · moverse   |[line break]|  INVENTARIO · PUNTOS · MIRAR · EXAMINAR [bracket]objeto[close bracket]         |[line break]+==========================================================+[variable letter spacing]".

[================================================================
  ACTO II: LA RED — MUNDO FÍSICO
================================================================]

[--- CALLE EMBAJADORES ---]

Calle Embajadores is a room in el mundo fisico.
The printed name of Calle Embajadores is "Calle Embajadores".
The description of Calle Embajadores is "Una calle ancha que baja hacia Lavapiés. La acera brilla mojada bajo los faroles de vapor de sodio — luz naranja, sombras largas. Los portales cerrados, las persianas metálicas echadas. En la esquina hay una churrería con las sillas patas arriba.[paragraph break]Embajadores 47 es un edificio de cuatro plantas con la fachada descascarillada. El portal tiene una puerta de cristal armado que no cierra del todo — la cerradura lleva meses rota.[if Ropa-puesta is false][paragraph break]El frío de octubre te recuerda que sigues en pijama.[end if][paragraph break]ENTRAR para acceder al portal.".
Calle Embajadores is south of La calle.

Instead of going south from La calle when Acto-1-completo is false:
	say "No tienes razón para alejarte ahora. El mensaje de 2:341/199 todavía no te ha dado destino.".

[--- PORTAL EMBAJADORES 47 ---]

Portal Embajadores is a room in el mundo fisico.
The printed name of Portal Embajadores is "Portal · Embajadores 47".
The description of Portal Embajadores is "Baldosas hidráulicas rojas y negras, la mayoría agrietadas. Una escalera de madera que cruje desde el primer peldaño. La bombilla es de 25 vatios.[paragraph break]En la pared izquierda, seis buzones de hierro pintados de negro. Cinco tienen etiquetas mecanografiadas con apellidos. El del Bajo B lleva solo una pegatina amarillenta — sin nombre.[if Dead-drop-encontrado is false][paragraph break]Entre la parte trasera del buzón B y la pared hay un hueco de dos centímetros. Algo podría haberse guardado ahí. REGISTRAR BUZÓN para investigarlo.[end if][paragraph break]La calle queda al sur.".
Portal Embajadores is inside from Calle Embajadores.

The los-buzones is a fixed in place thing in Portal Embajadores.
The printed name of the los-buzones is "buzones".
Understand "buzon" and "buzones" and "buzón" and "buzon b" and "buzón b" and "bajo b" and "casillero" as the los-buzones.
The description of the los-buzones is "Seis buzones de hierro negro. Cinco tienen apellidos. El del Bajo B lleva solo una pegatina sin nombre.[if Dead-drop-encontrado is false] Entre la parte trasera y la pared hay un hueco.[end if]".
The los-buzones is scenery.

After going to Portal Embajadores when Portal-visitado is false:
	now Portal-visitado is true;
	increase the score by 20;
	say "[bracket]+ 20 puntos: portal de Embajadores 47 alcanzado.[close bracket]".

[--- OBJETOS DEL DEAD DROP ---]

The sobre-embajadores is a thing.
The printed name of the sobre-embajadores is "sobre Manila".
Understand "sobre" and "sobre manila" and "sobre sellado" and "sobre embajadores" as the sobre-embajadores.
The description of the sobre-embajadores is "[if sobre-leido is false]Un sobre Manila A4 sellado con cinta americana. En la cubierta, a lápiz: [bold type]Belky — cuando llegue el mensaje[roman type]. LEER SOBRE para abrirlo.[else]Ya abierto. Contenía: foto de Carlos, nota manuscrita, fragmento 3.[end if]".

The foto-carlos is a thing.
The printed name of the foto-carlos is "foto de Carlos".
Understand "foto" and "fotografía" and "fotografia" and "foto carlos" and "imagen" as the foto-carlos.
The description of the foto-carlos is "[if Foto-examinada is false]Una fotografía 10×15 en blanco y negro. Carlos Mendoza García de pie frente a un edificio de oficinas. Tres hombres de traje en el fondo, de espaldas. Al dorso, a bolígrafo: [bold type]14 sep 1991[roman type]. Seis semanas antes de su muerte.[paragraph break]El rótulo del edificio queda casi fuera de encuadre. EXAMINAR FOTO con más detenimiento para leerlo.[else]El edificio del fondo: [bold type]BANCO COMERCIAL EUROPEO — Sucursal Orense[roman type]. 14 sep 1991. Carlos estaba siguiendo a alguien sin que lo supieran. Seis semanas después moría en la Coruña km.14.[end if]".

The nota-manuscrita is a thing.
The printed name of the nota-manuscrita is "nota manuscrita".
Understand "nota" and "nota manuscrita" and "carta" and "apunte" as the nota-manuscrita.
The description of the nota-manuscrita is "[fixed letter spacing]B —[line break] [line break]si lees esto es q el mensaje llegó.[line break]guarda los fragmentos.[line break] [line break]los seis son necesarios.[line break]ninguno sirve solo.[line break] [line break]el que buscas en mordor:[line break]2:341/56  contraseña: DARKNODE91[line break]torquemada sabe quién soy.[line break]confía en él.[line break] [line break]no hables con nadie más.[line break] [line break]— C.M.[variable letter spacing]".

[================================================================
  ACTO II: LA RED — MUNDO DIGITAL (MORDOR BBS)
================================================================]

[--- MORDOR BBS: BIENVENIDA ---]

Mordor-bienvenida is a room in el mundo digital.
The printed name of Mordor-bienvenida is "Mordor BBS :: Bienvenida".
The description of Mordor-bienvenida is "[fixed letter spacing]+==========================================================+[line break]|  MORDOR BBS  ·  Valladolid  ·  FidoNet 2:341/56          |[line break]|  SysOp: Torquemada  ·  9600 bps  ·  ZModem               |[line break]|  [italic type]'Lo que está muerto puede volver.'[roman type]                      |[line break]+==========================================================+[variable letter spacing][paragraph break][if Torquemada-fase is 0][bold type]IDENTIFÍCATE O DESCONÉCTATE. SysOp monitoring.[roman type][paragraph break]HABLAR CON TORQUEMADA para identificarte.[else if Torquemada-fase < 3]Torquemada está en línea. HABLAR CON TORQUEMADA para continuar.[else]Torquemada está en línea. El correo está al este.[end if][paragraph break]DESCONECTAR para salir.".

[--- MORDOR BBS: CORREO ---]

Mordor-correo is a room in el mundo digital.
The printed name of Mordor-correo is "Mordor BBS :: Correo".
The description of Mordor-correo is "Bandeja de correo de Mordor.[paragraph break][fixed letter spacing]Mensajes:[line break][if Torquemada-fase >= 3 and Fragmento4-obtenido is false]  [bold type]1[roman type]  DE: Torquemada@2:341/56  ASUNTO: Para cuando llegues  [bold type]*NUEVO[roman type][else if Fragmento4-obtenido is true]  1  DE: Torquemada@2:341/56  ASUNTO: Para cuando llegues[else]  (vacío)[end if][variable letter spacing][paragraph break]LEER MENSAJE para abrir. Bienvenida al oeste.".
Mordor-correo is east of Mordor-bienvenida.

[--- NPC: TORQUEMADA ---]

Torquemada is a person in Mordor-bienvenida.
Understand "torquemada" and "sysop" and "sysop mordor" as Torquemada.
The description of Torquemada is "[if Torquemada-fase is 0]Solo un handle en el sistema. Llevas cuatro años cruzando correo por su nodo sin hablar directamente.[else if Torquemada-fase < 3]Está en línea. Sus respuestas son cortas y calculadas. Lleva tres años esperando esto.[else]Ha hablado. Sabe quién eras y por qué estás aquí.[end if]".

[--- NETMAIL DE TORQUEMADA ---]

The torquemada-netmail is a fixed in place thing in Mordor-correo.
The printed name of the torquemada-netmail is "mensaje de Torquemada".
Understand "mensaje torquemada" and "mensaje 1" and "mensaje" and "correo mordor" as the torquemada-netmail.

[================================================================
  REGLAS DE ACCIÓN — ACTO II
================================================================]

[--- VESTIRSE ---]

Check getting-dressed:
	if the player is not in Tu cuarto:
		say "No estás en tu cuarto." instead;
	if Ropa-puesta is true:
		say "Ya llevas ropa de calle." instead.

Carry out getting-dressed:
	now Ropa-puesta is true;
	say "Te pones unos vaqueros oscuros, la camiseta de los Pixies y la cazadora de cuero. Botas de punta de acero. En tres minutos estás listo para salir.[paragraph break]Son las doce menos cuarto de la noche.".

[--- REGISTRAR BUZÓN ---]

Check searching-mailbox:
	if the player is not in Portal Embajadores:
		say "No hay buzones que registrar aquí." instead.

Carry out searching-mailbox:
	if Dead-drop-encontrado is true:
		say "Ya has recogido el sobre. El hueco está vacío.";
	else:
		now Dead-drop-encontrado is true;
		increase the score by 25;
		now the sobre-embajadores is carried by the player;
		say "Metes los dedos en el hueco entre el buzón B y la pared.[paragraph break]Hay algo. Un sobre Manila doblado en dos, con la cinta americana vieja todavía pegada al hormigón. Lo arrancas con cuidado. Tres años en el frío del portal.[paragraph break]En la cubierta, a lápiz, con una letra que reconoces de las postales de la red: [bold type]Belky — cuando llegue el mensaje[roman type].[paragraph break][bracket]+ 25 puntos: dead drop encontrado y recuperado.[close bracket]".

[--- LEER SOBRE ---]

Instead of reading the sobre-embajadores:
	if sobre-leido is true:
		say "Ya lo has abierto.[paragraph break][bold type]Fragmento 3: MNTRI-00047-QQZXW-PPLOE-33318[roman type][paragraph break]Dentro están también la foto de Carlos y la nota manuscrita.";
	else:
		now sobre-leido is true;
		now the foto-carlos is carried by the player;
		now the nota-manuscrita is carried by the player;
		increase the score by 35;
		say "Rompes la cinta americana con los dedos. El papel lleva tres años aquí — un poco amarillento, un poco húmedo en los bordes, pero intacto.[paragraph break]Dentro:[line break]  — Una fotografía en blanco y negro, 10×15[line break]  — Una nota doblada en cuatro[line break]  — Un papel con cinco grupos de caracteres[paragraph break][fixed letter spacing]FRAGMENTO 3:[line break][bold type]MNTRI-00047-QQZXW-PPLOE-33318[roman type][variable letter spacing][paragraph break][bracket]+ 35 puntos: sobre abierto, fragmento 3 recuperado.[close bracket]".

Instead of reading the nota-manuscrita:
	say "[description of the nota-manuscrita]".

[--- EXAMINAR FOTO ---]

Instead of examining the foto-carlos:
	if Foto-examinada is true:
		say "[description of the foto-carlos]";
	else if sobre-leido is false:
		say "Aún no has abierto el sobre.";
	else:
		now Foto-examinada is true;
		increase the score by 40;
		say "La miras despacio, acercándola a la luz.[paragraph break]El edificio del fondo tiene un rótulo que se corta en el margen del encuadre. Se lee: [bold type]BANCO COMERCIAL EUROPEO — Sucursal Orense[roman type].[paragraph break]Fecha en el dorso: 14 sep 1991. Los tres hombres de traje no miran a la cámara. Carlos los fotografiaba sin que lo supieran. Uno lleva una cartera de cuero marrón cerrada. La luz del atardecer alarga las sombras.[paragraph break]Seis semanas después, Carlos moría en la Carretera de La Coruña, km.14.[paragraph break][bracket]+ 40 puntos: Banco Comercial Europeo, Orense. 14 sep 1991.[close bracket]".

[--- CONECTAR A MORDOR BBS ---]

Check dialing-mordor:
	if Mordor-conectado is true:
		say "Ya estás conectado a Mordor BBS." instead;
	if Conectado is true:
		say "Desconéctate de Caverna-7 primero. DESCONECTAR." instead;
	if the player is not in Tu cuarto:
		say "No estás frente al terminal." instead;
	if Sobre-leido is false:
		say "Tienes el número de Mordor en la libreta. Pero antes de llamar, revisa el dead drop de Embajadores." instead.

Carry out dialing-mordor:
	now Mordor-conectado is true;
	move the player to Mordor-bienvenida;
	increase the score by 50;
	say "[fixed letter spacing]ATDT983XXXXXX...[line break]RING   RING   RING[line break]CONNECT 9600[line break]----------------------------------------[variable letter spacing][paragraph break]Valladolid. Cuatro rings antes de que Mordor responda. La conexión es limpia.[paragraph break][bracket]+ 50 puntos: conexión establecida con Mordor BBS, 2:341/56.[close bracket]".

Instead of disconnecting when Mordor-conectado is true:
	now Mordor-conectado is false;
	move the player to Tu cuarto;
	say "[fixed letter spacing]NO CARRIER[variable letter spacing][paragraph break]Te desconectas de Mordor BBS. La pantalla vuelve al prompt de DOS: [bold type]C:\CAVERNA>[roman type]".

Instead of going when Mordor-conectado is true and the noun is up:
	try disconnecting.

[--- HABLAR CON TORQUEMADA ---]

Instead of talking to Torquemada:
	if Torquemada-fase is 0:
		now Torquemada-fase is 1;
		say "Escribes: 'Soy Belky. 2:341/202. He recibido el mensaje de 2:341/199.'[paragraph break]Dos minutos de silencio. La luz CARR del módem no parpadea — la conexión sigue activa, esperando.[paragraph break][fixed letter spacing]> Cuánto tiempo.[line break]> Tres años y dos semanas, exactamente.[line break]> ¿Tienes la contraseña?[variable letter spacing]";
	else if Torquemada-fase is 1:
		if nota-manuscrita is carried by the player:
			now Torquemada-fase is 2;
			increase the score by 50;
			say "Escribes la contraseña de la nota de Carlos: DARKNODE91.[paragraph break][fixed letter spacing]> Correcto.[line break]> Carlos me dijo que alguien vendría con eso algún día.[line break]> Pensé que sería antes.[variable letter spacing][paragraph break]Torquemada está hablando. HABLAR CON TORQUEMADA para continuar.[paragraph break][bracket]+ 50 puntos: autenticación en Mordor BBS, confianza establecida.[close bracket]";
		else:
			say "[fixed letter spacing]> Necesito la contraseña de autenticación.[line break]> Carlos la dejó para quien viniera a buscarlo.[line break]> Sin contraseña, no hay conversación.[variable letter spacing][paragraph break]Revisa el dead drop de Embajadores 47. La contraseña está en la nota que dejó Carlos.";
	else if Torquemada-fase is 2:
		now Torquemada-fase is 3;
		say "[fixed letter spacing]> Carlos me llamó dos días antes de morir.[line break]> 21 de octubre del 91. Tarde. Desde una cabina.[line break]> Me dijo que tenía pruebas de algo gordo.[line break]> Alguien usaba los nodos FidoNet como conducto.[line break]> Datos cifrados ocultos en el flujo normal de echomail.[line break]> Transferencias financieras. Mucho dinero. Nombres.[line break] [line break]> Partió la clave en seis fragmentos.[line break]> Los distribuyó entre seis sysops que no se conocían.[line break]> Yo guardaba el cuatro.[line break] [line break]> Dos días después murió en la Carretera de La Coruña.[line break]> No fue un accidente.[variable letter spacing][paragraph break]Silencio en la línea. Luego:[paragraph break][fixed letter spacing]> El fragmento cuatro está en tu bandeja de correo.[line break]> Al este desde aquí.[variable letter spacing]";
	else:
		say "[fixed letter spacing]> Ve a por los tres que faltan.[line break]> 2:341/88   · VelvetBBS  · Bilbao    · Silencia[line break]> 2:341/134  · NOCTURNO   · Sevilla   · Hexer[line break]> 2:341/211  · TERMINAL7  · Barcelona · r4d[line break] [line break]> Los otros dos, Carlos no me dijo quiénes los tenían.[line break]> Muévete rápido. Si reactivaron el paquete esta noche,[line break]> es porque saben que el mensaje llegó.[variable letter spacing]".

[--- LEER NETMAIL DE TORQUEMADA ---]

Instead of reading the torquemada-netmail:
	if Torquemada-fase < 3:
		say "La bandeja está vacía.";
	else if Fragmento4-obtenido is true:
		say "Ya lo has leído.[paragraph break][bold type]Fragmento 4: VWXYZ-55503-AAQRT-IIUOP-77764[roman type]";
	else:
		now Fragmento4-obtenido is true;
		increase the score by 30;
		say "[fixed letter spacing]--- NETMAIL · DE: Torquemada@2:341/56 -------------------[line break]Belky.[line break] [line break]Guarda esto.[line break] [line break]FRAGMENTO 4:[line break][bold type]VWXYZ-55503-AAQRT-IIUOP-77764[roman type][line break] [line break]Los seis juntos forman la clave de descifrado.[line break]Lo que Carlos encontró lleva tres años cifrado,[line break]esperando que alguien juntara los fragmentos.[line break] [line break]Los tres sysops que quedan:[line break]2:341/88   · VelvetBBS  · Bilbao    · Silencia[line break]2:341/134  · NOCTURNO   · Sevilla   · Hexer[line break]2:341/211  · TERMINAL7  · Barcelona · r4d[line break] [line break]No sé quién tiene los fragmentos cinco y seis.[line break]Carlos nunca me lo dijo.[line break] [line break]Muévete. Si lo reactivaron esta noche,[line break]saben que el mensaje llegó.[line break] [line break]-- T[variable letter spacing][paragraph break][bracket]+ 30 puntos: fragmento 4 recuperado. Nuevos nodos: Bilbao, Sevilla, Barcelona.[close bracket]".

[--- FIN DE ACTO II ---]

Every turn when Fragmento4-obtenido is true and Acto-2-completo is false:
	now Acto-2-completo is true;
	say "[line break]----------------------------------------------------------[paragraph break]Cuatro fragmentos. Dos del mensaje de Carlos, uno del dead drop que dejó esperándote en Embajadores tres años, uno que Torquemada guardó desde aquella llamada del 21 de octubre del 91.[paragraph break]Quedan dos fragmentos sin localizar. Y en algún sitio, a medianoche del 23 de octubre de 1994, alguien sabe que has movido los hilos.[paragraph break][bold type]===================================================[roman type][paragraph break][bold type]   FIN DEL ACTO II — LA RED[roman type][paragraph break][bold type]===================================================[roman type][paragraph break][italic type]Acto III: El Archivo. Tres BBS. Tres ciudades. La clave ya tiene cuatro fragmentos. Lo que cifra sigue esperando.[roman type]".

[================================================================
  INICIO
================================================================]

When play begins:
	say "[fixed letter spacing]--------------------------------------------------------[line break] [line break]    N O D O   C E R O[line break] [line break]    Una aventura de ficción interactiva[line break]    VampireBBS 2026[line break] [line break]--------------------------------------------------------[variable letter spacing][paragraph break]Madrid. Octubre de 1994. Las 23:15.[paragraph break]El módem ha emitido un pitido. Solo uno. La señal de que has recibido un paquete FidoNet.[paragraph break]Llevas cuatro años como sysop de Caverna-7. Conoces el pitido. Pero esta noche hubo algo diferente en él — más tarde de lo normal, y seguido de un silencio que no reconoces.[paragraph break]La pantalla espera.[paragraph break][italic type](AYUDA para ver los comandos. CONECTAR para acceder a Caverna-7.)[roman type]";
	now the time of day is 11:15 PM.