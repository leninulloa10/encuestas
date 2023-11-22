import 'package:flutter/material.dart';
import 'package:get/get.dart';

class enviroment extends GetxController {
   //var url = "https://dc.backnicsimulador.xyz/".obs;
   //var url = "https://f931-181-113-117-242.ngrok-free.app/".obs;
   var url = "https://encuestas.backnicsimulador.xyz/".obs;
   //var url = "http://192.168.88.104:3004/".obs;
  var urlelecciones="https://elecciones.backnicsimulador.xyz/".obs;
  var jsonJuntas=[
    {
        "parroquia": [{
            "codigo_parroquia": 95,
            "nombre_parroquia": "AMBATILLO"
        },
       ], "recintos": [
            {
                "codigo_recinto": 1673,
                "nombre_recinto": "UNIDAD EDUCATIVA JOSE JOAQUIN OLMEDO",
                "direccion_recinto": "MADRID Y VALENCIA",
                "long": -78.655026,
                "lat": -1.231302,
                "jun_fem": 6,
                "jun_mas": 6,
                "num_jun": 12,
                "num_electores": 3736
            },
            {
                "codigo_recinto": 4633,
                "nombre_recinto": "UNIDAD EDUCATIVA REINALDO ESPINOZA BLOQUE 1",
                "direccion_recinto": "VALENCIA VIA A SAN FRANCISCO",
                "long": -78.663624,
                "lat": -1.210284,
                "jun_fem": 1,
                "jun_mas": 1,
                "num_jun": 2,
                "num_electores": 347
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 190,
            "nombre_parroquia": "ATAHUALPA \/CHIPZALATA"
        },
       ], "recintos": [
            {
                "codigo_recinto": 1424,
                "nombre_recinto": "UNIDAD EDUCATIVA ATAHUALPA",
                "direccion_recinto": "CONDOR MIRADOR Y 12 DE SEPTIEMBRE",
                "long": -78.611808,
                "lat": -1.214643,
                "jun_fem": 10,
                "jun_mas": 11,
                "num_jun": 21,
                "num_electores": 7350
            },
            {
                "codigo_recinto": 6498,
                "nombre_recinto": "UNIDAD EDUCATIVA ATAHUALPA BLOQUE 2 - EX ESCUELA CRISTOBAL COLON",
                "direccion_recinto": "AV. LUIS URQUIZO Y DESTACAMENTO TWINTZA",
                "long": -78.611626,
                "lat": -1.218356,
                "jun_fem": 3,
                "jun_mas": 2,
                "num_jun": 5,
                "num_electores": 1369
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 210,
            "nombre_parroquia": "AUGUSTO N MARTINEZ"
        },
       ], "recintos": [
            {
                "codigo_recinto": 1782,
                "nombre_recinto": "AULAS DE LA CATEQUESIS",
                "direccion_recinto": "LA CEIBA 03-05 Y 13 DE DICIEMBRE",
                "long": -78.619382,
                "lat": -1.218138,
                "jun_fem": 3,
                "jun_mas": 3,
                "num_jun": 6,
                "num_electores": 2034
            },
            {
                "codigo_recinto": 1292,
                "nombre_recinto": "UNIDAD EDUCATIVA AUGUSTO NICOLAS MARTINEZ BLOQUE 1 EX ESCUELA SECUNDINO EGUEZ 1",
                "direccion_recinto": "AV. 13 DE DICIEMBRE 04-210 Y CHANUL",
                "long": -78.618478,
                "lat": -1.218867,
                "jun_fem": 4,
                "jun_mas": 3,
                "num_jun": 7,
                "num_electores": 2450
            },
            {
                "codigo_recinto": 1296,
                "nombre_recinto": "UNIDAD EDUCATIVA AUGUSTO NICOLAS MARTINEZ BLOQUE 2 EX ESCUELA SECUNDINO EGUEZ 2",
                "direccion_recinto": "EL CHANUL Y 13 DE DICIEMBRE",
                "long": -78.618559,
                "lat": -1.218118,
                "jun_fem": 3,
                "jun_mas": 3,
                "num_jun": 6,
                "num_electores": 2100
            },
            {
                "codigo_recinto": 2878,
                "nombre_recinto": "CASA COMUNAL LA QUIGO EX ESCUELA GUATEMALA",
                "direccion_recinto": "LA HEROINA Y CEIBA",
                "long": -78.631641,
                "lat": -1.222396,
                "jun_fem": 1,
                "jun_mas": 1,
                "num_jun": 2,
                "num_electores": 298
            },
            {
                "codigo_recinto": 2879,
                "nombre_recinto": "ESCUELA DE EDUCACION BASICA MACARA",
                "direccion_recinto": "VIA A SAMANGA",
                "long": -78.616713,
                "lat": -1.180844,
                "jun_fem": 1,
                "jun_mas": 1,
                "num_jun": 2,
                "num_electores": 114
            },
            {
                "codigo_recinto": 2880,
                "nombre_recinto": "ESCUELA DE EDUCACION BASICA INTERCULTURAL BILINGUE NEPTALI SANCHO JARAMILLO",
                "direccion_recinto": "VIA CALHUA GRANDE",
                "long": -78.632768,
                "lat": -1.164834,
                "jun_fem": 1,
                "jun_mas": 1,
                "num_jun": 2,
                "num_electores": 346
            },
            {
                "codigo_recinto": 7046,
                "nombre_recinto": "COMPLEJO DEPORTIVO PARROQUIAL DE AUGUSTO N. MARTINEZ",
                "direccion_recinto": "EL CAOBA Y EL ENEBRO",
                "long": -78.62004,
                "lat": -1.217721,
                "jun_fem": 1,
                "jun_mas": 2,
                "num_jun": 3,
                "num_electores": 1050
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 635,
            "nombre_parroquia": "CONSTANTINO FERNANDEZ"
        },
       ], "recintos": [
            {
                "codigo_recinto": 1771,
                "nombre_recinto": "UNIDAD EDUCATIVA HONORATO VASQUEZ",
                "direccion_recinto": "ROMERILLO Y 28 DE JULIO",
                "long": -78.637373,
                "lat": -1.199705,
                "jun_fem": 4,
                "jun_mas": 4,
                "num_jun": 8,
                "num_electores": 2527
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 800,
            "nombre_parroquia": "CUNCHIBAMBA"
        },
       ], "recintos": [
            {
                "codigo_recinto": 938,
                "nombre_recinto": "UNIDAD EDUCATIVA DARIO GUEVARA",
                "direccion_recinto": "PANAMERICANA NORTE Y CHORRERA",
                "long": -78.587195,
                "lat": -1.138021,
                "jun_fem": 5,
                "jun_mas": 5,
                "num_jun": 10,
                "num_electores": 3341
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 810,
            "nombre_parroquia": "UNAMUNCHO"
        },
       ], "recintos": [
            {
                "codigo_recinto": 2859,
                "nombre_recinto": "UNIDAD EDUCATIVA TOMAS SEVILLA BLOQUE 1",
                "direccion_recinto": "ANDRES PINCH Y PUEGAN",
                "long": -78.600773,
                "lat": -1.159998,
                "jun_fem": 3,
                "jun_mas": 3,
                "num_jun": 6,
                "num_electores": 1881
            },
            {
                "codigo_recinto": 2860,
                "nombre_recinto": "UNIDAD EDUCATIVA TOMAS SEVILLA BLOQUE 2 EX ESCUELA ADELA MARTINEZ",
                "direccion_recinto": "CAMINO DEL INCA VIA A PUERTO ARTURO",
                "long": -78.588188,
                "lat": -1.153379,
                "jun_fem": 1,
                "jun_mas": 1,
                "num_jun": 2,
                "num_electores": 345
            },
            {
                "codigo_recinto": 6878,
                "nombre_recinto": "ESCUELA DE EDUCACION BASICA ALFONSINA STORNI",
                "direccion_recinto": "AMAZONICOS Y ANDINOS",
                "long": -78.590595,
                "lat": -1.182627,
                "jun_fem": 1,
                "jun_mas": 1,
                "num_jun": 2,
                "num_electores": 400
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 1625,
            "nombre_parroquia": "HUACHI GRANDE"
        },
       ], "recintos": [
            {
                "codigo_recinto": 2651,
                "nombre_recinto": "GAD PARROQUIAL HUACHI GRANDE",
                "direccion_recinto": "MONTANA Y AV. ATAHUALPA",
                "long": -78.637321,
                "lat": -1.307274,
                "jun_fem": 2,
                "jun_mas": 1,
                "num_jun": 3,
                "num_electores": 857
            },
            {
                "codigo_recinto": 2653,
                "nombre_recinto": "UNIDAD EDUCATIVA HONDURAS",
                "direccion_recinto": "PABLO MUÑOZ SANZ Y GONZALO CASTRO",
                "long": -78.617167,
                "lat": -1.291051,
                "jun_fem": 1,
                "jun_mas": 1,
                "num_jun": 2,
                "num_electores": 428
            },
            {
                "codigo_recinto": 2655,
                "nombre_recinto": "UNIDAD EDUCATIVA HUACHI GRANDE EX ESCUELA 9 DE OCTUBRE",
                "direccion_recinto": "ILLINOIS y ALASKA",
                "long": -78.638453,
                "lat": -1.306678,
                "jun_fem": 4,
                "jun_mas": 5,
                "num_jun": 9,
                "num_electores": 3150
            },
            {
                "codigo_recinto": 1727,
                "nombre_recinto": "UNIDAD EDUCATIVA HUACHI GRANDE SEDE 2 EX ESCUELA VICENTE FLOR",
                "direccion_recinto": "NEVADA E ILLINOIS",
                "long": -78.637607,
                "lat": -1.308205,
                "jun_fem": 5,
                "jun_mas": 5,
                "num_jun": 10,
                "num_electores": 3500
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 1745,
            "nombre_parroquia": "IZAMBA"
        },
       ], "recintos": [
            {
                "codigo_recinto": 1120,
                "nombre_recinto": "UNIDAD EDUCATIVA FISCOMISIONAL TIRSO DE MOLINA",
                "direccion_recinto": "AV PEDRO VASCONEZ",
                "long": -78.592591,
                "lat": -1.227208,
                "jun_fem": 10,
                "jun_mas": 10,
                "num_jun": 20,
                "num_electores": 7000
            },
            {
                "codigo_recinto": 830,
                "nombre_recinto": "UNIDAD EDUCATIVA JULIO ENRIQUE FERNANDEZ",
                "direccion_recinto": "MENTOR TACOAMAN Y ALFONSO TROYA",
                "long": -78.587448,
                "lat": -1.227501,
                "jun_fem": 5,
                "jun_mas": 5,
                "num_jun": 10,
                "num_electores": 3124
            },
            {
                "codigo_recinto": 1722,
                "nombre_recinto": "UNIDAD EDUCATIVA FISCOMISIONAL TIRSO DE MOLINA BLOQUE 2",
                "direccion_recinto": "AV PEDRO VASCONEZ",
                "long": -78.591907,
                "lat": -1.227399,
                "jun_fem": 5,
                "jun_mas": 5,
                "num_jun": 10,
                "num_electores": 3500
            },
            {
                "codigo_recinto": 6357,
                "nombre_recinto": "UNIDAD EDUCATIVA CEBI",
                "direccion_recinto": "MODESTO CHACON Y PEDRO VASCONEZ",
                "long": -78.584365,
                "lat": -1.225943,
                "jun_fem": 3,
                "jun_mas": 3,
                "num_jun": 6,
                "num_electores": 2100
            },
            {
                "codigo_recinto": 6993,
                "nombre_recinto": "UNIDAD EDUCATIVA AMBATO DE LOS ANGELES",
                "direccion_recinto": "AV. PEDRO VASCONEZ Y CIRO PEÑAHERRERA",
                "long": -78.585503,
                "lat": -1.225863,
                "jun_fem": 3,
                "jun_mas": 2,
                "num_jun": 5,
                "num_electores": 1750
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 1860,
            "nombre_parroquia": "JUAN BENIGNO VELA"
        },
       ], "recintos": [
            {
                "codigo_recinto": 1505,
                "nombre_recinto": "UNIDAD EDUCATIVA JUAN BENIGNO VELA BLOQUE 2 EX BELISARIO QUEVEDO",
                "direccion_recinto": "MOISES BUENAÑO Y ENRIQUE NUÑEZ",
                "long": -78.694687,
                "lat": -1.301935,
                "jun_fem": 5,
                "jun_mas": 5,
                "num_jun": 10,
                "num_electores": 3130
            },
            {
                "codigo_recinto": 1734,
                "nombre_recinto": "UNIDAD EDUCATIVA JUAN BENIGNO VELA - EX COLEGIO JOSE FIDEL HIDALGO",
                "direccion_recinto": "VIA A GUARANDA PASAJE LA MERCED",
                "long": -78.69094,
                "lat": -1.298691,
                "jun_fem": 5,
                "jun_mas": 5,
                "num_jun": 10,
                "num_electores": 3500
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 2435,
            "nombre_parroquia": "MONTALVO"
        },
       ], "recintos": [
            {
                "codigo_recinto": 3210,
                "nombre_recinto": "ESCUELA DE EDUCACION BASICA ELOY ALFARO",
                "direccion_recinto": "7 TRATADOS Y ESPECTADORES",
                "long": -78.62697,
                "lat": -1.330776,
                "jun_fem": 3,
                "jun_mas": 3,
                "num_jun": 6,
                "num_electores": 1545
            },
            {
                "codigo_recinto": 3131,
                "nombre_recinto": "CASA DEL PUEBLO MONTALVO",
                "direccion_recinto": "7 TRATADOS Y JUAN MONTALVO",
                "long": -78.627294,
                "lat": -1.330423,
                "jun_fem": 2,
                "jun_mas": 2,
                "num_jun": 4,
                "num_electores": 1400
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 2775,
            "nombre_parroquia": "PASA"
        },
       ], "recintos": [
            {
                "codigo_recinto": 2728,
                "nombre_recinto": "UNIDAD EDUCATIVA PASA BLOQUE 4 EX JUAN ESPIN 1",
                "direccion_recinto": "RAFAEL ARIAS Y AQUILINO FERNANDEZ",
                "long": -78.731932,
                "lat": -1.268426,
                "jun_fem": 3,
                "jun_mas": 3,
                "num_jun": 6,
                "num_electores": 2100
            },
            {
                "codigo_recinto": 2775,
                "nombre_recinto": "UNIDAD EDUCATIVA MANUEL MARIA SANCHEZ",
                "direccion_recinto": "S\/N",
                "long": -78.702127,
                "lat": -1.273145,
                "jun_fem": 1,
                "jun_mas": 1,
                "num_jun": 2,
                "num_electores": 407
            },
            {
                "codigo_recinto": 2764,
                "nombre_recinto": "UNIDAD EDUCATIVA PASA BLOQUE 2 EX JUAN ESPIN 2",
                "direccion_recinto": "RAFAEL ARIAS Y JOAQUIN CALVACHE",
                "long": -78.731979,
                "lat": -1.26967,
                "jun_fem": 3,
                "jun_mas": 3,
                "num_jun": 6,
                "num_electores": 2100
            },
            {
                "codigo_recinto": 1718,
                "nombre_recinto": "UNIDAD EDUCATIVA PASA BLOQUE 1",
                "direccion_recinto": "ALFONSO ALDAS Y JUAN ANTONIO QUILLIGANA",
                "long": -78.73347,
                "lat": -1.266742,
                "jun_fem": 3,
                "jun_mas": 3,
                "num_jun": 6,
                "num_electores": 1895
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 2830,
            "nombre_parroquia": "PICAYHUA"
        },
       ], "recintos": [
            {
                "codigo_recinto": 2533,
                "nombre_recinto": "CANCHA CUBIERTA DEL GAD PARROQUIAL PICAIHUA",
                "direccion_recinto": "JOSE INGENIEROS Y PITAGORAS",
                "long": -78.584826,
                "lat": -1.275877,
                "jun_fem": 4,
                "jun_mas": 4,
                "num_jun": 8,
                "num_electores": 2800
            },
            {
                "codigo_recinto": 1779,
                "nombre_recinto": "UNIDAD EDUCATIVA PICAIHUA EX EMILIO PARDO BAZAN",
                "direccion_recinto": "SAN AGUSTIN Y JOSE INGENIEROS",
                "long": -78.586792,
                "lat": -1.276065,
                "jun_fem": 5,
                "jun_mas": 5,
                "num_jun": 10,
                "num_electores": 3500
            },
            {
                "codigo_recinto": 1780,
                "nombre_recinto": "UNIDAD EDUCATIVA PICAIHUA EX COLEGIO PICAIHUA",
                "direccion_recinto": "CALLE LOS CIPRESES VÍA CASERIO SIMON BOLIVAR",
                "long": -78.580608,
                "lat": -1.273211,
                "jun_fem": 6,
                "jun_mas": 5,
                "num_jun": 11,
                "num_electores": 3693
            },
            {
                "codigo_recinto": 3332,
                "nombre_recinto": "CASA COMUNAL SIGSIPAMBA EX ESCUELA AGUSTO MARIÑO",
                "direccion_recinto": "VIA SAN JUAN",
                "long": -78.561223,
                "lat": -1.250517,
                "jun_fem": 1,
                "jun_mas": 1,
                "num_jun": 2,
                "num_electores": 97
            },
            {
                "codigo_recinto": 3479,
                "nombre_recinto": "UNIDAD EDUCATIVA PICAIHUA EX CRISTOBAL VELA",
                "direccion_recinto": "VÍA CASERIO SIMON BOLIVAR Y LOS CIPRESES",
                "long": -78.580199,
                "lat": -1.273351,
                "jun_fem": 4,
                "jun_mas": 4,
                "num_jun": 8,
                "num_electores": 2800
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 2860,
            "nombre_parroquia": "PILAHUIN"
        },
       ], "recintos": [
            {
                "codigo_recinto": 2626,
                "nombre_recinto": "COLISEO PARROQUIAL DE PILAHUIN",
                "direccion_recinto": "BOLIVAR Y JUAN MONTALVO",
                "long": -78.725348,
                "lat": -1.293769,
                "jun_fem": 3,
                "jun_mas": 2,
                "num_jun": 5,
                "num_electores": 1353
            },
            {
                "codigo_recinto": 1366,
                "nombre_recinto": "ESCUELA DE EDUCACION BASICA INTERCULTURAL BILINGUE JOSE FELIX AYALA",
                "direccion_recinto": "VIA A PALUGSHA PUCARA GRANDE",
                "long": -78.737086,
                "lat": -1.313601,
                "jun_fem": 5,
                "jun_mas": 5,
                "num_jun": 10,
                "num_electores": 3500
            },
            {
                "codigo_recinto": 1371,
                "nombre_recinto": "UNIDAD EDUCATIVA PILAHUIN",
                "direccion_recinto": "VÍA A GUARANDA KM 17",
                "long": -78.72642,
                "lat": -1.296472,
                "jun_fem": 5,
                "jun_mas": 5,
                "num_jun": 10,
                "num_electores": 3500
            },
            {
                "codigo_recinto": 3213,
                "nombre_recinto": "UNIDAD EDUCATIVA INTERCULTURAL BILINGUE LLANGAHUA",
                "direccion_recinto": "VIA ANTIGUA A GUARANDA",
                "long": -78.853806,
                "lat": -1.308753,
                "jun_fem": 2,
                "jun_mas": 1,
                "num_jun": 3,
                "num_electores": 788
            },
            {
                "codigo_recinto": 3318,
                "nombre_recinto": "UNIDAD EDUCATIVA INTERCULTURAL BILINGUE TAMBOLOMA",
                "direccion_recinto": "VIA MULANLEO",
                "long": -78.772318,
                "lat": -1.306937,
                "jun_fem": 2,
                "jun_mas": 2,
                "num_jun": 4,
                "num_electores": 1115
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 3120,
            "nombre_parroquia": "QUISAPINCHA"
        },
       ], "recintos": [
            {
                "codigo_recinto": 2774,
                "nombre_recinto": "UNIDAD EDUCATIVA CASAHUALA",
                "direccion_recinto": "VIA CALGUASIG",
                "long": -78.709181,
                "lat": -1.226931,
                "jun_fem": 2,
                "jun_mas": 1,
                "num_jun": 3,
                "num_electores": 806
            },
            {
                "codigo_recinto": 1055,
                "nombre_recinto": "UNIDAD EDUCATIVA QUISAPINCHA BLOQUE 1",
                "direccion_recinto": "GONZALES SUAREZ Y ALONSO PALACIOS",
                "long": -78.683972,
                "lat": -1.236002,
                "jun_fem": 8,
                "jun_mas": 7,
                "num_jun": 15,
                "num_electores": 5250
            },
            {
                "codigo_recinto": 1060,
                "nombre_recinto": "UNIDAD EDUCATIVA QUISAPINCHA BLOQUE 2 EX ESCUELA ELIAS TORO FUNES",
                "direccion_recinto": "VÍA A SANTA ELENA Y ALONSO PALACIOS",
                "long": -78.681105,
                "lat": -1.237771,
                "jun_fem": 7,
                "jun_mas": 7,
                "num_jun": 14,
                "num_electores": 4734
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 3355,
            "nombre_parroquia": "SAN BARTOLOME DE PINLLO"
        },
       ], "recintos": [
            {
                "codigo_recinto": 1006,
                "nombre_recinto": "UNIDAD EDUCATIVA NICOLAS MARTINEZ BLOQUE 1",
                "direccion_recinto": "LA NACION Y PRECURSOR",
                "long": -78.641381,
                "lat": -1.232312,
                "jun_fem": 4,
                "jun_mas": 3,
                "num_jun": 7,
                "num_electores": 2450
            },
            {
                "codigo_recinto": 3419,
                "nombre_recinto": "UNIDAD EDUCATIVA NICOLAS MARTINEZ BLOQUE 2 EX JARDIN LOS CAPULLITOS",
                "direccion_recinto": "SHUARTZ Y LA NACION",
                "long": -78.64139,
                "lat": -1.232314,
                "jun_fem": 2,
                "jun_mas": 2,
                "num_jun": 4,
                "num_electores": 1400
            },
            {
                "codigo_recinto": 3424,
                "nombre_recinto": "UNIDAD EDUCATIVA NICOLAS VASCONEZ",
                "direccion_recinto": "ANGAMARQUILLO CENTRO",
                "long": -78.652422,
                "lat": -1.204706,
                "jun_fem": 2,
                "jun_mas": 2,
                "num_jun": 4,
                "num_electores": 931
            },
            {
                "codigo_recinto": 3480,
                "nombre_recinto": "AULAS DE LA CATEQUESIS DON BOSCO",
                "direccion_recinto": "MAUGERI Y PERIODICO EL COSMOS",
                "long": -78.641143,
                "lat": -1.232828,
                "jun_fem": 2,
                "jun_mas": 1,
                "num_jun": 3,
                "num_electores": 762
            },
            {
                "codigo_recinto": 6915,
                "nombre_recinto": "UNIDAD EDUCATIVA GENESIS",
                "direccion_recinto": "AGUACOLLAS Y OLLERO",
                "long": -78.635473,
                "lat": -1.235288,
                "jun_fem": 2,
                "jun_mas": 4,
                "num_jun": 6,
                "num_electores": 2100
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 3380,
            "nombre_parroquia": "SAN FERNANDO"
        },
       ], "recintos": [
            {
                "codigo_recinto": 1721,
                "nombre_recinto": "UNIDAD EDUCATIVA TOMAS MARTINEZ",
                "direccion_recinto": "QUITO Y AMBATO",
                "long": -78.749477,
                "lat": -1.265087,
                "jun_fem": 4,
                "jun_mas": 3,
                "num_jun": 7,
                "num_electores": 2291
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 3730,
            "nombre_parroquia": "SANTA ROSA"
        },
       ], "recintos": [
            {
                "codigo_recinto": 1416,
                "nombre_recinto": "UNIDAD EDUCATIVA SANTA ROSA BLOQUE 1 EX REINALDO MIÑO",
                "direccion_recinto": "ROCAFUERTE Y 24 DE MAYO",
                "long": -78.660101,
                "lat": -1.285375,
                "jun_fem": 9,
                "jun_mas": 9,
                "num_jun": 18,
                "num_electores": 6300
            },
            {
                "codigo_recinto": 1389,
                "nombre_recinto": "UNIDAD EDUCATIVA SANTA ROSA BLOQUE 2",
                "direccion_recinto": "GONZALEZ SUAREZ Y ANTONIO JOSE DE SUCRE",
                "long": -78.665947,
                "lat": -1.283079,
                "jun_fem": 8,
                "jun_mas": 6,
                "num_jun": 14,
                "num_electores": 4900
            },
            {
                "codigo_recinto": 4634,
                "nombre_recinto": "UNIDAD EDUCATIVA INTERCULTURAL BILINGUE HUAYNA CAPAC",
                "direccion_recinto": "VIA JUAN BENIGNO VELA - TISALEO",
                "long": -78.68843,
                "lat": -1.322066,
                "jun_fem": 1,
                "jun_mas": 1,
                "num_jun": 2,
                "num_electores": 173
            },
            {
                "codigo_recinto": 6468,
                "nombre_recinto": "CASA PARROQUIAL ECLESIASTICA DE SANTA ROSA \/ GAD SANTA ROSA",
                "direccion_recinto": "ELOY ALFARO Y GARCIA MORENO",
                "long": -78.66304,
                "lat": -1.281996,
                "jun_fem": 3,
                "jun_mas": 4,
                "num_jun": 7,
                "num_electores": 2261
            },
            {
                "codigo_recinto": 6999,
                "nombre_recinto": "ESCUELA DE EDUCACION BASICA ARCHIPIELAGO DE GALAPAGOS",
                "direccion_recinto": "ROCAFUERTE VIA EL QUINCHE",
                "long": -78.655323,
                "lat": -1.291769,
                "jun_fem": 3,
                "jun_mas": 3,
                "num_jun": 6,
                "num_electores": 2100
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 4065,
            "nombre_parroquia": "TOTORAS"
        },
       ], "recintos": [
            {
                "codigo_recinto": 2130,
                "nombre_recinto": "SINDICATO DE CHOFERES PROFESIONALES 15 DE AGOSTO",
                "direccion_recinto": "ORQUIDEAS S\/N Y REINA DEL TRANSITO",
                "long": -78.595936,
                "lat": -1.315876,
                "jun_fem": 1,
                "jun_mas": 1,
                "num_jun": 2,
                "num_electores": 700
            },
            {
                "codigo_recinto": 2133,
                "nombre_recinto": "COLISEO SINDICATO DE CHOFERES",
                "direccion_recinto": "DALIAS Y MAGNOLIAS",
                "long": -78.596054,
                "lat": -1.314773,
                "jun_fem": 2,
                "jun_mas": 3,
                "num_jun": 5,
                "num_electores": 1236
            },
            {
                "codigo_recinto": 2134,
                "nombre_recinto": "UNIDAD EDUCATIVA EL ORO",
                "direccion_recinto": "HUACHI TOTORAS",
                "long": -78.609839,
                "lat": -1.305955,
                "jun_fem": 1,
                "jun_mas": 1,
                "num_jun": 2,
                "num_electores": 687
            },
            {
                "codigo_recinto": 2136,
                "nombre_recinto": "UNIDAD EDUCATIVA TOTORAS BLOQUE 2",
                "direccion_recinto": "MAGNOLIAS Y ORQUIDEAS",
                "long": -78.595191,
                "lat": -1.31591,
                "jun_fem": 3,
                "jun_mas": 2,
                "num_jun": 5,
                "num_electores": 1750
            },
            {
                "codigo_recinto": 2138,
                "nombre_recinto": "UNIDAD EDUCATIVA TOTORAS BLOQUE 1",
                "direccion_recinto": "ORQUIDEAS S\/N Y REINA DEL TRANSITO",
                "long": -78.59555,
                "lat": -1.31555,
                "jun_fem": 2,
                "jun_mas": 2,
                "num_jun": 4,
                "num_electores": 1400
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 5045,
            "nombre_parroquia": "ATOCHA FICOA"
        },
       ], "recintos": [
            {
                "codigo_recinto": 817,
                "nombre_recinto": "UNIDAD EDUCATIVA SAN ALFONSO",
                "direccion_recinto": "LAS LIMAS Y AGUACATES",
                "long": -78.639823,
                "lat": -1.242453,
                "jun_fem": 4,
                "jun_mas": 4,
                "num_jun": 8,
                "num_electores": 2800
            },
            {
                "codigo_recinto": 843,
                "nombre_recinto": "UNIDAD EDUCATIVA SANTO DOMINGO DE GUZMAN",
                "direccion_recinto": "AV. LOS GUAYTAMBOS Y LOS HIGOS",
                "long": -78.639694,
                "lat": -1.244176,
                "jun_fem": 11,
                "jun_mas": 11,
                "num_jun": 22,
                "num_electores": 7700
            },
            {
                "codigo_recinto": 1676,
                "nombre_recinto": "UNIDAD EDUCATIVA RUMIÑAHUI BLOQUE 2 EX ESCUELA EDUARDO MERA",
                "direccion_recinto": "LA DELICIA Y AVENIDA RODRIGO PACHANO",
                "long": -78.633772,
                "lat": -1.239572,
                "jun_fem": 4,
                "jun_mas": 3,
                "num_jun": 7,
                "num_electores": 2096
            },
            {
                "codigo_recinto": 5113,
                "nombre_recinto": "UNIDAD EDUCATIVA RUMIÑAHUI BLOQUE 1",
                "direccion_recinto": "AV. RODRIGO PACHANO Y EDUARDO MERA",
                "long": -78.629866,
                "lat": -1.23258,
                "jun_fem": 1,
                "jun_mas": 1,
                "num_jun": 2,
                "num_electores": 75
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 5445,
            "nombre_parroquia": "HUACHI LORETO"
        },
       ], "recintos": [
            {
                "codigo_recinto": 1346,
                "nombre_recinto": "UNIDAD EDUCATIVA GUAYAQUIL",
                "direccion_recinto": "AV. BOLIVARIANA Y JUAN DE DIOS MORALES",
                "long": -78.614941,
                "lat": -1.257661,
                "jun_fem": 10,
                "jun_mas": 10,
                "num_jun": 20,
                "num_electores": 7000
            },
            {
                "codigo_recinto": 445,
                "nombre_recinto": "ESCUELA DE EDUCACION BASICA SERGIO QUIROLA",
                "direccion_recinto": "COTACACHI Y PASOCHOA",
                "long": -78.622249,
                "lat": -1.240818,
                "jun_fem": 4,
                "jun_mas": 4,
                "num_jun": 8,
                "num_electores": 2800
            },
            {
                "codigo_recinto": 279,
                "nombre_recinto": "ESCUELA DE EDUCACION BASICA MANUELA ESPEJO",
                "direccion_recinto": "TOA Y QUIMBALEMBO",
                "long": -78.629555,
                "lat": -1.248022,
                "jun_fem": 7,
                "jun_mas": 5,
                "num_jun": 12,
                "num_electores": 4200
            },
            {
                "codigo_recinto": 440,
                "nombre_recinto": "UNIDAD EDUCATIVA MARIO COBO BARONA",
                "direccion_recinto": "AV. RUMIÑAHUI Y LOS SHYRIS",
                "long": -78.628937,
                "lat": -1.253851,
                "jun_fem": 10,
                "jun_mas": 10,
                "num_jun": 20,
                "num_electores": 7000
            },
            {
                "codigo_recinto": 442,
                "nombre_recinto": "UNIDAD EDUCATIVA HISPANO AMERICA BLOQUE 2 EX ESCUELA HUMBERTO ALBORNOZ",
                "direccion_recinto": "AVENIDA BOLIVARIANA Y CHINDUL",
                "long": -78.622506,
                "lat": -1.243947,
                "jun_fem": 7,
                "jun_mas": 6,
                "num_jun": 13,
                "num_electores": 4550
            },
            {
                "codigo_recinto": 1741,
                "nombre_recinto": "UNIDAD EDUCATIVA LUIS A. MARTINEZ AGROPECUARIO",
                "direccion_recinto": "AV. RUMIÑAHUI Y PICHINCHA ALTA",
                "long": -78.625623,
                "lat": -1.253847,
                "jun_fem": 10,
                "jun_mas": 10,
                "num_jun": 20,
                "num_electores": 7000
            },
            {
                "codigo_recinto": 269,
                "nombre_recinto": "UNIDAD EDUCATIVA GONZALEZ SUAREZ",
                "direccion_recinto": "AVENIDA PICHINCHA Y QUIZ QUIZ",
                "long": -78.625907,
                "lat": -1.247257,
                "jun_fem": 6,
                "jun_mas": 6,
                "num_jun": 12,
                "num_electores": 4200
            },
            {
                "codigo_recinto": 396,
                "nombre_recinto": "ESCUELA DE EDUCACION BASICA EDUARDO REYES NARANJO",
                "direccion_recinto": "CAMINO EL REY Y PASAJE SUMACO",
                "long": -78.617914,
                "lat": -1.245714,
                "jun_fem": 6,
                "jun_mas": 6,
                "num_jun": 12,
                "num_electores": 4200
            },
            {
                "codigo_recinto": 1728,
                "nombre_recinto": "UNIDAD EDUCATIVA HISPANO AMERICA BLOQUE 1",
                "direccion_recinto": "AV. BOLIVARIANA Y CHINDUL",
                "long": -78.621814,
                "lat": -1.244098,
                "jun_fem": 10,
                "jun_mas": 10,
                "num_jun": 20,
                "num_electores": 7000
            },
            {
                "codigo_recinto": 6370,
                "nombre_recinto": "UNIDAD EDUCATIVA JUAN LEON MERA LA SALLE",
                "direccion_recinto": "AV. LOS CHASQUIS Y RIO GUAYLLABAMBA",
                "long": -78.62505,
                "lat": -1.265514,
                "jun_fem": 7,
                "jun_mas": 6,
                "num_jun": 13,
                "num_electores": 4550
            },
            {
                "codigo_recinto": 7030,
                "nombre_recinto": "POLIDEPORTIVO IVAN VALLEJO",
                "direccion_recinto": "AV BOLIVARIANA Y VICTOR HUGO",
                "long": -78.61398,
                "lat": -1.261185,
                "jun_fem": 4,
                "jun_mas": 3,
                "num_jun": 7,
                "num_electores": 2396
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 5230,
            "nombre_parroquia": "CELIANO MONGE"
        },
       ], "recintos": [
            {
                "codigo_recinto": 449,
                "nombre_recinto": "ESCUELA DE EDUCACION BASICA FE Y ALEGRIA",
                "direccion_recinto": "ISIDRO VITERI 7-07 Y PASAJE SOLANDA",
                "long": -78.621979,
                "lat": -1.258766,
                "jun_fem": 5,
                "jun_mas": 4,
                "num_jun": 9,
                "num_electores": 2820
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 5455,
            "nombre_parroquia": "HUACHI CHICO"
        },
       ], "recintos": [
            {
                "codigo_recinto": 514,
                "nombre_recinto": "UNIDAD EDUCATIVA FRANCISCO FLOR BLOQUE 3",
                "direccion_recinto": "CERVANTES Y RIO MISAHUALLI",
                "long": -78.628488,
                "lat": -1.272432,
                "jun_fem": 5,
                "jun_mas": 5,
                "num_jun": 10,
                "num_electores": 3500
            },
            {
                "codigo_recinto": 518,
                "nombre_recinto": "UNIDAD EDUCATIVA FRANCISCO FLOR BLOQUE 2 EX ESCUELA 3 DE NOVIEMBRE",
                "direccion_recinto": "AV. ATAHUALPA Y JULIO JARAMILLO",
                "long": -78.629574,
                "lat": -1.275251,
                "jun_fem": 5,
                "jun_mas": 5,
                "num_jun": 10,
                "num_electores": 3500
            },
            {
                "codigo_recinto": 1685,
                "nombre_recinto": "UNIVERSIDAD TECNICA DE AMBATO - FACULTAD DE CIENCIAS ADMINISTRATIVAS",
                "direccion_recinto": "AV. LOS CHASQUIS Y RIO CUTUCHI",
                "long": -78.625574,
                "lat": -1.268004,
                "jun_fem": 5,
                "jun_mas": 5,
                "num_jun": 10,
                "num_electores": 3500
            },
            {
                "codigo_recinto": 1628,
                "nombre_recinto": "UNIVERSIDAD TECNICA DE AMBATO - FACULTAD DE CONTABILIDAD Y AUDITORIA",
                "direccion_recinto": "AV. LOS CHASQUIS Y RIO CUTUCHI",
                "long": -78.624962,
                "lat": -1.268395,
                "jun_fem": 3,
                "jun_mas": 4,
                "num_jun": 7,
                "num_electores": 2450
            },
            {
                "codigo_recinto": 2525,
                "nombre_recinto": "UNIVERSIDAD TECNICA DE AMBATO - FACULTAD DE CIENCIAS HUMANAS Y DE LA EDUCACION",
                "direccion_recinto": "LOS CHASQUIS Y RIO CUTUCHI",
                "long": -78.624999,
                "lat": -1.267949,
                "jun_fem": 10,
                "jun_mas": 9,
                "num_jun": 19,
                "num_electores": 6650
            },
            {
                "codigo_recinto": 6127,
                "nombre_recinto": "UNIVERSIDAD TECNICA DE AMBATO - FACULTAD DE SISTEMAS, ELECTRONICA E INDUSTRIAL - FISEI",
                "direccion_recinto": "AV LOS CHASQUIS Y RIO CUTUCHI",
                "long": -78.624155,
                "lat": -1.267958,
                "jun_fem": 7,
                "jun_mas": 7,
                "num_jun": 14,
                "num_electores": 4659
            },
            {
                "codigo_recinto": 6063,
                "nombre_recinto": "UNIVERSIDAD TECNICA DE AMBATO - FACULTAD DE ALIMENTOS",
                "direccion_recinto": "AV LOS CHASQUIS Y RÍO CUTUCHI",
                "long": -78.623786,
                "lat": -1.269105,
                "jun_fem": 7,
                "jun_mas": 6,
                "num_jun": 13,
                "num_electores": 4550
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 5545,
            "nombre_parroquia": "LA MATRIZ"
        },
       ], "recintos": [
            {
                "codigo_recinto": 1128,
                "nombre_recinto": "UNIDAD EDUCATIVA LICEO CEVALLOS",
                "direccion_recinto": "BOLIVAR 159 Y FRANCISCO FLOR",
                "long": -78.631674,
                "lat": -1.243816,
                "jun_fem": 8,
                "jun_mas": 8,
                "num_jun": 16,
                "num_electores": 5600
            },
            {
                "codigo_recinto": 1151,
                "nombre_recinto": "UNIDAD EDUCATIVA LA INMACULADA",
                "direccion_recinto": "AV. MIRAFLORES 11-59 Y MARGARITAS",
                "long": -78.638163,
                "lat": -1.249143,
                "jun_fem": 1,
                "jun_mas": 1,
                "num_jun": 2,
                "num_electores": 157
            },
            {
                "codigo_recinto": 1689,
                "nombre_recinto": "CENTRO DE IDIOMAS DE LA UNIVERSIDAD TECNICA DE AMBATO",
                "direccion_recinto": "ROCAFUERTE Y QUITO",
                "long": -78.631037,
                "lat": -1.241821,
                "jun_fem": 6,
                "jun_mas": 4,
                "num_jun": 10,
                "num_electores": 3500
            },
            {
                "codigo_recinto": 1773,
                "nombre_recinto": "UNIDAD EDUCATIVA LUIS A. MARTINEZ - CENTRO",
                "direccion_recinto": "QUITO Y CEVALLOS",
                "long": -78.629406,
                "lat": -1.244502,
                "jun_fem": 8,
                "jun_mas": 8,
                "num_jun": 16,
                "num_electores": 5600
            },
            {
                "codigo_recinto": 61,
                "nombre_recinto": "UNIDAD EDUCATIVA GENERAL ELOY ALFARO DELGADO",
                "direccion_recinto": "CADIZ 06-36 Y BARCELONA",
                "long": -78.636263,
                "lat": -1.256207,
                "jun_fem": 6,
                "jun_mas": 5,
                "num_jun": 11,
                "num_electores": 3661
            },
            {
                "codigo_recinto": 1776,
                "nombre_recinto": "UNIDAD EDUCATIVA BOLIVAR",
                "direccion_recinto": "QUIZ QUIZ Y AV. ATAHUALPA",
                "long": -78.635217,
                "lat": -1.252227,
                "jun_fem": 12,
                "jun_mas": 10,
                "num_jun": 22,
                "num_electores": 7700
            },
            {
                "codigo_recinto": 6367,
                "nombre_recinto": "UNIDAD EDUCATIVA LA PROVIDENCIA",
                "direccion_recinto": "AV. CEVALLOS Y LALAMA",
                "long": -78.626538,
                "lat": -1.241875,
                "jun_fem": 5,
                "jun_mas": 5,
                "num_jun": 10,
                "num_electores": 3500
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 5560,
            "nombre_parroquia": "LA MERCED"
        },
       ], "recintos": [
            {
                "codigo_recinto": 453,
                "nombre_recinto": "UNIDAD EDUCATIVA TERESA FLOR",
                "direccion_recinto": "CEVALLOS Y VARGAS TORRES",
                "long": -78.621896,
                "lat": -1.23732,
                "jun_fem": 7,
                "jun_mas": 3,
                "num_jun": 10,
                "num_electores": 3140
            },
            {
                "codigo_recinto": 485,
                "nombre_recinto": "UNIDAD EDUCATIVA JUAN BENIGNO VELA - LA MERCED",
                "direccion_recinto": "ROCAFUERTE 01-18 Y VARGAS TORRES",
                "long": -78.623866,
                "lat": -1.235193,
                "jun_fem": 5,
                "jun_mas": 5,
                "num_jun": 10,
                "num_electores": 3500
            },
            {
                "codigo_recinto": 1675,
                "nombre_recinto": "UNIDAD EDUCATIVA AMBATO",
                "direccion_recinto": "VARGAS TORRES Y GARCIA MORENO",
                "long": -78.625059,
                "lat": -1.233693,
                "jun_fem": 5,
                "jun_mas": 5,
                "num_jun": 10,
                "num_electores": 3500
            },
            {
                "codigo_recinto": 1679,
                "nombre_recinto": "UNIDAD EDUCATIVA AMBATO BLOQUE 2 EX ESCUELA EUGENIA MERA",
                "direccion_recinto": "HUMBERTO ALBORNOZ Y AYLLON",
                "long": -78.626842,
                "lat": -1.23321,
                "jun_fem": 4,
                "jun_mas": 4,
                "num_jun": 8,
                "num_electores": 2800
            },
            {
                "codigo_recinto": 6290,
                "nombre_recinto": "UNIVERSIDAD TECNICA DE AMBATO FACULTAD DE CIENCIAS DE LA SALUD",
                "direccion_recinto": "AV. COLOMBIA Y EL SALVADOR",
                "long": -78.616147,
                "lat": -1.234288,
                "jun_fem": 7,
                "jun_mas": 7,
                "num_jun": 14,
                "num_electores": 4900
            },
            {
                "codigo_recinto": 6368,
                "nombre_recinto": "UNIDAD EDUCATIVA SAGRADA FAMILIA",
                "direccion_recinto": "AV. LAS AMÉRICAS Y SABANILLA",
                "long": -78.614247,
                "lat": -1.238688,
                "jun_fem": 6,
                "jun_mas": 6,
                "num_jun": 12,
                "num_electores": 4200
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 5605,
            "nombre_parroquia": "LA PENINSULA"
        },
       ], "recintos": [
            {
                "codigo_recinto": 2987,
                "nombre_recinto": "ESCUELA DE EDUCACION BASICA MARQUES DE SELVA ALEGRE",
                "direccion_recinto": "BOGOTA Y ASUNCION",
                "long": -78.606942,
                "lat": -1.243797,
                "jun_fem": 3,
                "jun_mas": 3,
                "num_jun": 6,
                "num_electores": 2094
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 5840,
            "nombre_parroquia": "PISHILATA"
        },
       ], "recintos": [
            {
                "codigo_recinto": 2804,
                "nombre_recinto": "UNIDAD EDUCATIVA LA GRAN MURALLA BLOQUE 1",
                "direccion_recinto": "FRANS PETTER SCHUBERT Y AMADEUS MOZART",
                "long": -78.578919,
                "lat": -1.254354,
                "jun_fem": 1,
                "jun_mas": 1,
                "num_jun": 2,
                "num_electores": 259
            },
            {
                "codigo_recinto": 2847,
                "nombre_recinto": "ESCUELA DE EDUCACION BASICA GENERAL CORDOVA",
                "direccion_recinto": "CARLOTA JARAMILLO Y CARLOS MENDOZA MOREIRA",
                "long": -78.611857,
                "lat": -1.27901,
                "jun_fem": 2,
                "jun_mas": 2,
                "num_jun": 4,
                "num_electores": 1128
            },
            {
                "codigo_recinto": 2827,
                "nombre_recinto": "UNIDAD EDUCATIVA LUIS FELIPE BORJA",
                "direccion_recinto": "AV.BENJAMIN FRANKLIN Y HENRY CAVINDISH",
                "long": -78.595883,
                "lat": -1.260216,
                "jun_fem": 2,
                "jun_mas": 1,
                "num_jun": 3,
                "num_electores": 876
            },
            {
                "codigo_recinto": 2866,
                "nombre_recinto": "ATRIO DE LA IGLESIA CRISTO SALVADOR",
                "direccion_recinto": "AV. EUROPA",
                "long": -78.609654,
                "lat": -1.254593,
                "jun_fem": 2,
                "jun_mas": 2,
                "num_jun": 4,
                "num_electores": 969
            }
        ]
    },
    {
        "parroquia": [{
            "codigo_parroquia": 5945,
            "nombre_parroquia": "SAN FRANCISCO"
        },
       ], "recintos": [
            {
                "codigo_recinto": 1036,
                "nombre_recinto": "UNIDAD EDUCATIVA BOLIVAR CENTRO",
                "direccion_recinto": "SUCRE ENTRE LALAMA Y MARTINEZ",
                "long": -78.627427,
                "lat": -1.240712,
                "jun_fem": 5,
                "jun_mas": 4,
                "num_jun": 9,
                "num_electores": 2813
            },
            {
                "codigo_recinto": 1013,
                "nombre_recinto": "UNIDAD EDUCATIVA LICEO JUAN MONTALVO",
                "direccion_recinto": "ROCAFUERTE 09-022 Y ESPEJO",
                "long": -78.627281,
                "lat": -1.238751,
                "jun_fem": 6,
                "jun_mas": 6,
                "num_jun": 12,
                "num_electores": 4200
            }
        ]
    }
].obs;

}
