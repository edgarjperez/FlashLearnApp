//
//  DataStore.swift
//  FlashLearn
//
//  Created by Edgar Perez on 3/5/25.
//

import Foundation

class DataStore {
    static let sampleTopics = [
        Topic( // 0
            id: UUID(),
            title: "Señales de tráfico",
            description: "Conocimiento sobre las señales de tráfico en España",
            content: """
            Las señales de tráfico en España se dividen en varias categorías:
            
            1. Señales de advertencia de peligro: Triangulares con borde rojo
            2. Señales de prohibición: Circulares con borde rojo
            3. Señales de obligación: Circulares con fondo azul
            4. Señales de información: Cuadradas o rectangulares con fondo azul
            5. Señales de prioridad: Como el ceda el paso o stop
            
            Conocer estas señales es fundamental para una conducción segura y para aprobar el examen teórico.
            """
        ),
        
        Topic( // 1
            id: UUID(),
            title: "Normas de circulación",
            description: "Reglas básicas para circular en vías españolas",
            content: """
            Las normas de circulación son el conjunto de reglas que regulan el tráfico en las vías públicas. Incluyen:
            
            - Normas de prioridad en intersecciones
            - Velocidades máximas permitidas
            - Distancia de seguridad
            - Normas de adelantamiento
            - Uso de luces y señales acústicas
            - Comportamiento en rotondas
            
            El conocimiento y cumplimiento de estas normas es obligatorio para todos los conductores.
            """
        ),
        
        Topic( // 2
            id: UUID(),
            title: "Seguridad vial",
            description: "Elementos y comportamientos para una conducción segura",
            content: """
            La seguridad vial incluye todos los elementos y comportamientos destinados a prevenir accidentes:
            
            - Uso del cinturón de seguridad
            - Sistemas de retención infantil
            - Uso del casco en motocicletas
            - Estado de los neumáticos y frenos
            - Conducción bajo condiciones meteorológicas adversas
            - Conducción preventiva
            
            Una buena conducción debe priorizar siempre la seguridad de todos los usuarios de la vía.
            """
        ),
        
        Topic( // 3
            id: UUID(),
            title: "Alcohol y conducción",
            description: "Efectos del alcohol y normativa aplicable",
            content: """
            El alcohol afecta negativamente a la capacidad de conducción:
            
            - Reduce los reflejos y aumenta el tiempo de reacción
            - Altera la percepción de distancias y velocidades
            - Produce una falsa sensación de seguridad
            - Disminuye la capacidad de concentración
            
            En España, los límites legales son:
            - Conductores generales: 0,5 g/l en sangre o 0,25 mg/l en aire espirado
            - Conductores noveles y profesionales: 0,3 g/l en sangre o 0,15 mg/l en aire espirado
            
            Superar estos límites constituye una infracción que puede conllevar multas, retirada de puntos del carnet o incluso consecuencias penales.
            """
        ),
        
        Topic( // 4
            id: UUID(),
            title: "Documentación y trámites",
            description: "Documentos necesarios y procedimientos administrativos",
            content: """
            Para conducir legalmente en España se requiere:
            
            - Permiso de conducción válido
            - Documentación del vehículo (permiso de circulación)
            - Tarjeta de inspección técnica (ITV) en vigor
            - Seguro obligatorio
            
            Además, es importante conocer los trámites relacionados con:
            - Renovación del permiso de conducir
            - Transferencia de vehículos
            - Procedimientos en caso de pérdida o robo de documentación
            - Sistema de puntos del carnet de conducir
            """
        ),
        
        Topic( // 5
            id: UUID(),
            title: "Mecánica básica",
            description: "Conocimientos básicos sobre el funcionamiento del vehículo",
            content: """
            Todo conductor debe tener conocimientos básicos sobre:
            
            - Funcionamiento del motor
            - Sistemas de frenos
            - Sistema de dirección
            - Neumáticos y su mantenimiento
            - Líquidos del vehículo (aceite, refrigerante, etc.)
            - Sistemas de iluminación
            
            Estos conocimientos son importantes para el mantenimiento del vehículo y para resolver pequeñas averías.
            """
        )
    ]
    
    static let sampleFlashcards: [UUID: [Flashcard]] = {
            let topicIDs = sampleTopics.map { $0.id }
            
            return [
                topicIDs[0]: [
                    // Señales de tráfico
                     Flashcard(
                         id: UUID(),
                         topicID: topicIDs[0],
                         question: "¿Qué forma tienen las señales de peligro?",
                         answer: "Triangular con borde rojo y fondo blanco",
                         dificulty: 1
                     ),
                     Flashcard(
                         id: UUID(),
                         topicID: topicIDs[0],
                         question: "¿Qué indica una señal circular con borde rojo?",
                         answer: "Es una señal de prohibición o restricción",
                         dificulty: 2
                     ),
                     Flashcard(
                         id: UUID(),
                         topicID: topicIDs[0],
                         question: "¿De qué color es el fondo de las señales de obligación?",
                         answer: "Azul",
                         dificulty: 1
                     ),
                     Flashcard(
                         id: UUID(),
                         topicID: topicIDs[0],
                         question: "¿Qué significado tiene una señal triangular con un dibujo de niños?",
                         answer: "Advierte de la proximidad de un lugar frecuentado por niños, como un colegio o una zona de juegos",
                         dificulty: 3
                     ),
                ],
                topicIDs[1]: [
                    // Normas de circulación
                    
                Flashcard(
                  id: UUID(),
                  topicID: topicIDs[1],
                  question: "¿Cuál es la velocidad máxima genérica en autopistas?",
                  answer: "120 km/h",
                  dificulty: 1
                ),
                Flashcard(
                    id: UUID(),
                    topicID: topicIDs[1],
                    question: "¿Por qué lado debe realizarse el adelantamiento?",
                    answer: "Por la izquierda del vehículo al que se pretende adelantar",
                    dificulty: 2
                 ),
                 Flashcard(
                    id: UUID(),
                    topicID: topicIDs[1],
                    question: "¿Qué vehículos tienen prioridad en una glorieta o rotonda?",
                    answer: "Los vehículos que se encuentran dentro de la glorieta tienen prioridad sobre los que pretenden acceder a ella",
                    dificulty: 3
                 ),
                 Flashcard(
                    id: UUID(),
                    topicID: topicIDs[1],
                    question: "¿Cuál es la velocidad máxima en vías urbanas con un único carril por sentido?",
                    answer: "50 km/h",
                    dificulty: 2
                 ),
                ],
                topicIDs[2]: [
                    // Seguridad vial
                    Flashcard(
                        id: UUID(),
                        topicID: topicIDs[2],
                        question: "¿Cuándo es obligatorio el uso del cinturón de seguridad?",
                        answer: "Siempre, tanto en vías urbanas como interurbanas, y para todos los ocupantes del vehículo",
                        lastReviewed: nil,
                        dificulty: 1
                    ),
                    Flashcard(
                        id: UUID(),
                        topicID: topicIDs[2],
                        question: "¿Hasta qué altura es obligatorio el uso de sistemas de retención infantil?",
                        answer: "Hasta los 135 cm de altura. Los niños con una altura inferior deben utilizar un sistema de retención adecuado a su talla y peso",
                        lastReviewed: nil,
                        dificulty: 3
                    ),
                    Flashcard(
                        id: UUID(),
                        topicID: topicIDs[2],
                        question: "¿Qué es la distancia de seguridad y cómo se determina?",
                        answer: "Es el espacio necesario para detenerse sin colisionar con el vehículo precedente. Como regla general, debe ser la distancia recorrida en al menos 2 segundos",
                        lastReviewed: nil,
                        dificulty: 4
                    ),
                ],
                topicIDs[3]: [
                    // Alcohol y conducción
                    Flashcard(
                        id: UUID(),
                        topicID: topicIDs[3],
                        question: "¿Cuál es la tasa máxima de alcohol permitida para conductores noveles?",
                        answer: "0,3 g/l en sangre o 0,15 mg/l en aire espirado",
                        lastReviewed: nil,
                        dificulty: 2
                    ),
                    Flashcard(
                        id: UUID(),
                        topicID: topicIDs[3],
                        question: "¿Qué efectos produce el alcohol en la conducción?",
                        answer: "Reduce los reflejos, aumenta el tiempo de reacción, altera la percepción de velocidades y distancias, y produce una falsa sensación de seguridad",
                        lastReviewed: nil,
                        dificulty: 3
                    ),
                    Flashcard(
                        id: UUID(),
                        topicID: topicIDs[3],
                        question: "¿Es legal conducir después de consumir drogas?",
                        answer: "No. Está prohibido conducir con presencia de drogas en el organismo",
                        lastReviewed: nil,
                        dificulty: 1
                    ),
                ],
                topicIDs[4]: [
                    // Documentación y trámites
                    Flashcard(
                        id: UUID(),
                        topicID: topicIDs[4],
                        question: "¿Qué documentos debe llevar siempre el conductor?",
                        answer: "Permiso de conducción, permiso de circulación del vehículo, tarjeta de inspección técnica (ITV) y justificante del seguro obligatorio",
                        lastReviewed: nil,
                        dificulty: 2
                    ),
                    Flashcard(
                        id: UUID(),
                        topicID: topicIDs[4],
                        question: "¿Cada cuánto tiempo debe renovarse el permiso de conducir B para conductores menores de 65 años?",
                        answer: "Cada 10 años hasta los 65 años, y cada 5 años a partir de esa edad",
                        lastReviewed: nil,
                        dificulty: 3
                    ),
                    Flashcard(
                        id: UUID(),
                        topicID: topicIDs[4],
                        question: "¿Cuándo debe pasar la ITV un vehículo particular nuevo?",
                        answer: "A los 4 años desde su primera matriculación, luego cada 2 años hasta los 10 años, y después anualmente",
                        lastReviewed: nil,
                        dificulty: 4
                    ),
                ],
                topicIDs[5]: [
                    // Mecánica básica
                    Flashcard(
                        id: UUID(),
                        topicID: topicIDs[5],
                        question: "¿Qué se debe comprobar regularmente en los neumáticos?",
                        answer: "La presión, el desgaste de la banda de rodadura y posibles daños o deformaciones",
                        lastReviewed: nil,
                        dificulty: 2
                    ),
                    Flashcard(
                        id: UUID(),
                        topicID: topicIDs[5],
                        question: "¿Qué indica el testigo del aceite en el tablero?",
                        answer: "Puede indicar presión de aceite insuficiente o nivel bajo de aceite, dependiendo del vehículo",
                        lastReviewed: nil,
                        dificulty: 3
                    ),
                    Flashcard(
                        id: UUID(),
                        topicID: topicIDs[5],
                        question: "¿Cuál es la profundidad mínima legal del dibujo de los neumáticos?",
                        answer: "1,6 mm en toda la banda de rodadura",
                        lastReviewed: nil,
                        dificulty: 3
                    ),
                    Flashcard(
                        id: UUID(),
                        topicID: topicIDs[5],
                        question: "¿Qué consecuencias tiene circular con una presión de neumáticos incorrecta?",
                        answer: "Presión baja: mayor desgaste lateral, consumo y riesgo de reventón. Presión alta: menor adherencia, desgaste central y conducción más dura",
                        lastReviewed: nil,
                        dificulty: 4
                    )
                ]
            ]
        }()
        
        static func flashcardsForTopic(topicID: UUID) -> [Flashcard] {
            return sampleFlashcards[topicID] ?? []
        }
}
