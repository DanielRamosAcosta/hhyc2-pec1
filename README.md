# Enunciado P1

## Presentación

Con esta PEC empezamos la evaluación contínua de la asignatura Herramientas HTML y CSS II. Se propone un pequeño reto de desarrollo de un web de una sola página, partiendo de UOC Boilerplate, y en que se deberán aplicar los conocimientos adquiridos en los módulos 1 y 2. El encargo tiene unos requisitos mínimos que se especifican en el apartado de Descripción. Todo el proceso que sigas deberá de estar documentado, y deberás entregar exactamente lo que se pide en el apartado de Formato y fecha de entrega para poder ser evaluado.

El peso de esta PEC es de un **25%** de la nota de la evaluación contínua.

## Objetivos

- Diseñar y ejecutar un pequeño sitio web responsive de una sola página.
- Utilizar un workflow de desarrollo frontend moderno, partiendo UOC Boilerplate.
- Utilizar el lenguaje de preprocesado de estilos Sass.
- Escoger criterios de desarrollo (metodologías y guías de estilo) adecuados al tipo de encargo.
- Configurar y usar correctamente Stylelint en función de los criterios escogidos.
- Documentar el proceso de elección y aplicación de los criterios escogidos, así como el propio proceso de desarrollo.
- Publicar el repositorio en GitHub y realizar un deployment en Netlify.

## Descripción

La PEC consta de dos partes, que básicamente se configuran en desarrollo y documentación. Es necesario realizar y entregar ambas partes de la PEC para poder ser evaluado.

En la parte de desarrollo, deberás elaborar un sitio web que siga las características que se especifican a continuación:

- Debe ser un sitio web de una sola página.
- La página debe contener información sobre una ciudad que consideres interesante y recomiendes visitar. Si deseas realizar la PEC sobre cualquier otra temática que cumpla el resto de requisitos del enunciado, debes pedir la aprobación del profesor colaborador por correo electrónico antes del **17 de octubre de 2025**.
- La página debe ser responsive y se debe poder visualizar correctamente desde cualquier dispositivo moderno (teléfono, tablet, ordenador…).
- Debes partir de UOC Boilerplate para tu desarrollo. Asegúrate de estar usando la última versión (en el momento de escribir este enunciado, la última versión es la **3.12.0**). Debes respetar la estructura y nomenclatura de carpetas y ficheros (¡a menos que la metodología o guía de estilo escogida te indique lo contrario!). Tienes toda la información sobre la instalación y uso en la guía del módulo 1.
- Debes añadir alguna dependencia externa a UOC Boilerplate. En la guía del módulo 1 tienes como ejemplo cómo añadir FontAwesome, que puede ser una dependencia válida para este ejercicio. Pero si te atreves, puedes probar a añadir cualquier otra dependencia que creas útil. Si escoges otra dependencia, es buena idea que expliques en el foro cuál es, por qué la escogiste, y si tienes cualquier duda o incidencia con su uso.
- Debes escoger una o más de las metodologías estudiadas en el módulo 2 y aplicarlas en tu desarrollo. Además, puedes incluir una guía de estilo de las estudiadas u otras. Puedes debatir en el foro cuáles son las opciones más adecuadas.
- Deberás instalar Stylelint y personalizar su configuración para que aplique los criterios de estilos escogidos, con plugins y reglas personalizadas, como se explica en el módulo 2. Al ejecutar el comando de validación no debe aparecer ningún error. También puedes comentar en el foro qué plugins y reglas aplicaste.
- Debes utilizar necesariamente las siguientes características de Sass: variables, anidado, funciones (creadas por ti), parciales y importación.
- Una vez finalices el desarrollo debes publicar el código en GitHub y realizar un deployment en Netlify, como se explica en la guía del módulo 1.

Aparte de estos requisitos mínimos, puedes ampliar tu proyecto como lo creas oportuno.

El código que entregues deberá estar compilado para producción con el comando `npm run build`.

En la parte de documentación:

- Deberás documentar todo el proceso de desarrollo de esta práctica (descargar/clonar el repositorio, instalar dependencias, el entorno de desarrollo, la compliación para producción, la publicación, etc), explicando los pasos que seguiste y los resultados obtenidos.
- Deberás justificar la elección de metodología y/o guía de estilo en base al tipo de encargo, tus conocimientos, la metodología de desarrollo aplicada y la avenencia de los conceptos estudiados con el proyecto y tu estilo de código. Deberás explicar detalladamente cómo aplicaste los criterios escogidos a tu código, así como la configuración que realizaste en Stylelint para que se aplicaran estos criterios.
- Deberás explicar cualquier decisión de diseño y desarrollo que tomaras (por ejemplo: qué dependencias añadiste, si en tus hojas de estilo seguiste una aproximación desktop first o mobile first, …).
- Deberás incluír de forma clara los enlaces al repositorio de GitHub y la URL pública de Netlify.

## Criterios de evaluación

### Desarrollo (60%)

- Uso correcto de UOC Boilerplate y dependencias externas (10%)
- HTML (5%)
- Sass (10%)
- Diseño y responsiveness (10%)
- Aplicación de metodologías y guías de estilo, adecuación a estándares y calidad del código en general (10%)
- Configuración y aplicación Stylelint (10%)
- Repositorio y publicación (5%)

### Documentación (40%)

- Documentación del proceso de desarrollo (10%)
- Justificación de las decisiones tomadas en el desarrollo (10%)
- Justificación de la elección de la metodología y/o guía de estilo y memoria de la aplicación de los criterios elegidos (20%)

## Formato y fecha de entrega

La parte de desarrollo se debe entregar en una carpeta que contenga todos los ficheros del proyecto desarrollado, incluyendo la carpeta `dist/` correctamente compilada para producción, la carpeta `src/` con el código fuente desarrollado, y los ficheros de configuración que hay en la raíz del proyecto (atención, porque según vuestro entorno pueden ser ficheros ocultos, ¡aseguraos de incluírlos!). **No debéis incluír la carpeta `node_modules`**, ya que las dependencias de desarrollo cambian según el entorno. Cualquier entrega que contenga la carpeta `node_modules` será rechazada.

Se debe entregar la parte de documentación en un documento de texto en formato estándar, preferiblemente `.pdf`. Evita, a poder ser, formatos propietarios como `.doc` o `.pages`.

Se deberán entregar ambas partes dentro de un solo fichero comprimido en formato `.zip` o `.rar`, con vuestro nombre e indicando que se trata de la PEC 1, a través de la actividad denominada **"Entrega P1"**. No se admitirán entregas por ningún otro canal.

**La fecha límite de entrega es el domingo 2 de noviembre de 2025 a las 23.59 h.**

## Propiedad intelectual

A menudo es inevitable, al producir una obra multimedia, usar recursos creados por terceras personas. Es por lo tanto comprensible hacerlo en el marco de una práctica de este máster, siempre que esto se documente claramente y no suponga un plagio en la práctica.

Por lo tanto, al presentar una práctica que haga uso de recursos ajenos, se debe presentar junto a ella un documento en que se detallen todos estos recursos, especificando su nombre, autor, lugar donde se obtuvo y su estatus legal: si la obra está protegida por el copyright o se acoge a alguna otra licencia de uso (Creative Commons, licencia GNU, GPL ...). El estudiante deberá asegurarse que la licencia que sea no impida específicamente su uso en el marco de la práctica. En caso de no encontrar la información correspondiente, se deberá asumir que la obra está protegida por el copyright.

Además, se deberán adjuntar los ficheros originales cuando las obras utilizadas sean digitales, y su código fuente si corresponde.

## Plagio

A menos que se especifique en el enunciado, las pruebas de evaluación continua y las prácticas se deben realizar de forma individual. En caso de detectar actividades plagiadas, todas ellas serán calificadas con una nota de **D**.
