## Monkey and Banana (Prolog) & Red Bayesiana de Fallos de Servidor (CLIPS)
Este repositorio contiene dos proyectos independientes realizados como parte de prácticas de Inteligencia Artificial.

### Monkey and Banana (Prolog)
#### 📌 Descripción
Implementación en Prolog del problema clásico del mono y el plátano. El objetivo es encontrar una secuencia de acciones que permita al mono alcanzar y agarrar el plátano, desplazándose por un tablero de tamaño NxN, interactuando con una caja y utilizando acciones como caminar, empujar, subir y bajar de la caja, y agarrar el plátano.

#### 📄 Archivos
`monkeyAndBanana.pl`: Código fuente en Prolog.

#### ▶️ Cómo ejecutar
1. Copiar todo el contenido del archivo `monkeyAndBanana.pl`
2. Crear un programa en https://swish.swi-prolog.org/ y pegar el programa copiado
3. Si fuese necesario, cambiar el valor de dim, para establecer la N (ancho y largo del plano NxN)
4. Realizar las búsquedas (queries) que se deseen.

Formato de búsqueda: `eating(state(coordsMonkey(x,y), onfloor, coordsBox(x,y), coordsBanana(x,y), has-not), Path)`, donde:
* `coordsMonkey(x,y)`: Coordenadas iniciales del mono.
* `onfloor/onbox`: Si el mono se encuentra en el suelo o sobre la caja en el estado inicial.
* `coordsBox(x,y)`: Coordenadas iniciales de la caja.
* `coordsBanana(x,y)`: Coordenadas iniciales de la banana (colgada del techo). El mono deberá llevar la caja hacia esta posición; para posteriormente subirse en ella, con intención de agarrar el plátano.
* `has-not/has`: Si el mono posee la banana o no.

<img src="https://github.com/user-attachments/assets/0bf2dd11-f53d-42df-ac98-1dd03b8b454d" alt="Image" width="700"/>

#### 👥 Autores

- **Ayoze Ruano** — 🔗 [GitHub](https://github.com/ayozeruanoalc)
- **Enrique Reina** — 🔗 [GitHub](https://github.com/ellupe)

### Red Bayesiana de Fallos de Servidor (CLIPS)
#### 📌 Descripción
Implementación de una red bayesiana en CLIPS para el diagnóstico de fallos en servidores. Permite calcular la probabilidad de eventos como la caída del servidor, dados ciertos síntomas o evidencias observadas (por ejemplo, error de disco, RAM, CPU alta, etc.).

#### 📄 Archivos
`expertSystemForCPDHandlingUncertainty.clp`: Código fuente en CLIPS.

#### ▶️ Cómo ejecutar
1. `load` del programa en CLIPS
2. `reset` (para cargar las probabilidades ubicadas en hechos iniciales)
3. Se ingresa la consulta con este formato: `(assert (consulta (nombre x) (booleano y)))`
* `nombre`: debe ser uno de los nodos permitidos (ver lista abajo).
* `booleano`: **TRUE** → se consulta la probabilidad del evento sucediendo / **FALSE** → se consulta la probabilidad de que no suceda.
4. Se ingresan las evidencias con el siguiente formato: `(assert (evidencia (nombre x) (booleano y)))`
* `nombre`: debe ser uno de los nodos permitidos (ver lista abajo).
* `booleano`: **TRUE** → se toma la evidencia como verdadera / **FALSE** → se considera la evidencia como falsa.
5. `run` (ejecución del programa)

✅ **Nombres permitidos:** DiscoError, CPUAlta, SOInestable, TempAlta, RAMError, CaidaServidor y Reinicio

Ejemplo:

<img src="https://github.com/user-attachments/assets/e9f7858b-2f55-4f96-a09e-41663dca43e0" alt="Image" width="700"/>

#### Interpretación del ejemplo

La probabilidad de que se caiga el servidor dado que hay una temperatura elevada y que ocurrió un reinicio inesperado es: 0.948129032258065

#### Red bayesiana implementada:

<img src="https://github.com/user-attachments/assets/f98b1cf8-e9fe-45a3-b823-a46b19d22c52" alt="Image" width="700"/>

