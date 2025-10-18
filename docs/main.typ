#import "../../../../../cross/packages/packages/preview/tidbit-uoc/0.1.1/template.typ": template

#show: template.with(
    subject: "Herramientas HTML y CSS II",
    title: "PEC1: Bundlers y automatización web",
    subtitle: "Optimización del flujo de trabajo con herramientas de construcción modernas",
    date: datetime(year: 2025, month: 10, day: 17),
    author: "Daniel Ramos Acosta",
)

= Introducción

Esta práctica corresponde a la primera evaluación continua (PEC1) de la asignatura Herramientas HTML y CSS II, con un peso del 25% sobre la nota final. El objetivo principal es desarrollar un sitio web responsive de una sola página aplicando un workflow moderno de desarrollo frontend.

== Contexto del proyecto

Para esta práctica he decidido crear una landing page sobre San Cristóbal de La Laguna, ciudad declarada Patrimonio de la Humanidad por la UNESCO y lugar donde nací. Esta elección tiene un componente personal significativo, ya que me permite combinar el aprendizaje técnico con la promoción del patrimonio cultural de mi ciudad natal.

El proyecto consiste en crear una landing page informativa sobre San Cristóbal de La Laguna, implementando las mejores prácticas de desarrollo web moderno, utilizando preprocesadores CSS, automatización de tareas, y metodologías de arquitectura CSS. La página destaca aspectos como la rica historia de la ciudad, sus paisajes únicos entre el centro histórico y el litoral, y su reconocida gastronomía canaria.

== Objetivos

Los objetivos específicos de esta práctica son:

- Implementar un workflow de desarrollo moderno con bundlers y herramientas de automatización
- Aplicar una metodología CSS estructurada (BEM)
- Configurar y utilizar Stylelint para garantizar la calidad del código
- Utilizar Sass con todas sus características principales
- Crear un diseño responsive que funcione en múltiples dispositivos
- Publicar el proyecto en GitHub y desplegarlo en Netlify

== Estructura del documento

Este documento se estructura en las siguientes secciones principales:

1. *Proceso de desarrollo*: Configuración del entorno y herramientas utilizadas
2. *Metodología CSS*: Justificación y aplicación de BEM
3. *Configuración de Stylelint*: Reglas y validación del código
4. *Características de Sass*: Implementación de variables, funciones, mixins y parciales
5. *Diseño responsive*: Estrategia mobile-first y breakpoints
6. *Publicación*: GitHub y deployment en Netlify

= Proceso de desarrollo

Esta sección documenta todo el workflow seguido durante el desarrollo del proyecto, desde la configuración inicial hasta la publicación final.

== Propuesta de cambio de boilerplate

Para poder realizar una investigación más profunda sobre las herramientas modernas de desarrollo frontend, se propuso utilizar un boilerplate alternativo al UOC Boilerplate oficial.

=== Motivación del cambio

Las principales razones para este cambio fueron:

1. *Modernidad tecnológica*: Vite representa la última generación de bundlers, con un enfoque en velocidad y experiencia de desarrollo
2. *Relevancia profesional*: Vite es ampliamente utilizado en la industria actual, facilitando la transferencia de conocimientos al entorno laboral
3. *Aprendizaje avanzado*: Permite explorar características cutting-edge del ecosistema JavaScript/CSS
4. *Performance mejorada*: Hot Module Replacement (HMR) más rápido y builds de producción optimizados

Esta propuesta fue validada y aprobada por el profesor de la asignatura mediante comunicación por correo electrónico, condicionada a una justificación técnica adecuada en esta documentación.

= Configuración del entorno de desarrollo

== Análisis del UOC Boilerplate original

Antes de proceder con el cambio, se realizó un análisis exhaustivo del stack tecnológico propuesto en el UOC Boilerplate v3.12.0:

*Build System*

- *Parcel v2* - Module bundler principal que orquesta todo el proceso de compilación

*Estilos (CSS)*

- *Sass/SCSS* - Preprocesador CSS (`@parcel/transformer-sass`)
- *PostCSS* - Transformaciones CSS (`@parcel/transformer-postcss`)
  - Autoprefixer - Añade vendor prefixes automáticamente
  - postcss-preset-env - Permite usar CSS moderno con compatibilidad hacia atrás
- *LightningCSS* - Minificación y optimización de CSS en producción (`@parcel/optimizer-css`)

*HTML*

- *PostHTML* - Transformaciones HTML (`@parcel/transformer-posthtml`)
  - posthtml-include - Permite incluir archivos HTML parciales con `<include src="..."></include>`
- *htmlnano* - Minificación de HTML en producción (`@parcel/optimizer-htmlnano`)

*JavaScript*

- *Babel* - Transpilador de ES6+ a JavaScript compatible con navegadores antiguos (`@parcel/transformer-babel`)
- *SWC* - Minificación y optimización de JS en producción (`@parcel/optimizer-swc`)

*Imágenes*

- *Sharp* - Transformación y optimización de imágenes (`@parcel/transformer-image`)
  - Permite conversiones de formato (ej: WebP)
  - Permite redimensionamiento mediante query parameters

*Desarrollo*

- Servidor de desarrollo integrado en Parcel con live reload
- *npm-run-all* - Para ejecutar múltiples comandos npm en secuencia
- *rimraf* - Para limpiar carpetas de manera cross-platform

*Compatibilidad*

Target de navegadores configurado: `last 2 versions, > 0.5%, not dead`

Todo está configurado para funcionar automáticamente con Parcel, sin necesidad de configuración adicional de Webpack, Gulp o similares.

== Implementación del boilerplate personalizado con Vite

El objetivo fue crear un boilerplate equivalente al propuesto por la asignatura, pero aprovechando las capacidades modernas de Vite y características CSS de última generación.

=== Filosofía del proyecto

Se establecieron dos principios fundamentales para la migración del stack tecnológico:

1. *Equivalencia funcional*: Mantener el comportamiento y las características del UOC Boilerplate original, replicando todas sus capacidades de transformación, optimización y desarrollo.

2. *Modernización del motor*: Implementar todo sobre Vite para aprovechar sus características de velocidad, HMR mejorado y experiencia de desarrollo superior, sin sacrificar ninguna funcionalidad.

El enfoque no fue cambiar radicalmente el boilerplate, sino traducir el stack de Parcel a Vite de forma que:
- Las herramientas sean similares o equivalentes (Sharp, PostCSS, Sass, etc.)
- El output final sea comparable en calidad y optimización
- El workflow de desarrollo se mantenga familiar para quien conozca el boilerplate oficial
- Se gane en velocidad de desarrollo y build sin perder capacidades

En resumen: mismo comportamiento, mismas características, motor más moderno.

=== Instalación inicial de Vite

La instalación del entorno de trabajo se llevó a cabo utilizando el *scaffolding* oficial de Vite mediante el siguiente comando:

```bash
npm create vite@latest
```

Durante el proceso de configuración se seleccionó la plantilla *vanilla*, ya que en esta práctica no se empleará ningún *framework* web como React. Para el resto de opciones, se mantuvieron los valores predeterminados proporcionados por la herramienta.

#figure(image("images/vite-setup.jpg"), caption: [
Setup de instalación de Vite
])

== Configuración de herramientas de preprocesado y optimización

Con el entorno base ya creado, se procedió a configurar las herramientas necesarias para el preprocesamiento y la optimización del código fuente. En primer lugar, se incorporó *Sass* como preprocesador de CSS, renombrando el archivo principal `style.css` a `style.scss` e instalando la implementación oficial:

```bash
npm install -D sass-embedded
```

La elección de `sass-embedded` frente a `sass` responde a que esta versión utiliza la implementación oficial de Dart Sass, que ofrece un rendimiento superior y una actualización más constante que la versión compilada a JavaScript.

Posteriormente, se configuró *PostCSS* creando el archivo `.postcssrc.json`, en el que se añadieron los *plugins* `postcss-preset-env` y `autoprefixer`. Además, se estableció la lista de navegadores objetivo mediante la propiedad `browserslist` en el `package.json`, con el valor `"last 2 versions, > 0.5%, not dead"`, replicando así la configuración del *boilerplate* original.

No fue necesario incluir *LightningCSS*, ya que Vite utiliza *esbuild* para la minificación del CSS en producción, garantizando un rendimiento óptimo.

En cuanto al tratamiento del HTML, se integró el *plugin* `vite-plugin-posthtml`, que permite procesar los archivos HTML mediante *PostHTML*. Dado que Vite no realiza minificación de HTML de forma nativa, se añadió también el *plugin* `vite-plugin-html-minifier` con el fin de optimizar los archivos durante el proceso de compilación.

Para el código JavaScript, no se consideró necesario incorporar *Babel*, puesto que Vite también delega en *esbuild* las tareas de transpilación y minificación, cumpliendo sobradamente los requisitos del proyecto.

Finalmente, para optimizar los recursos gráficos, se instaló el *plugin* `vite-plugin-image-optimizer`, el cual emplea *Sharp* para el procesado de imágenes rasterizadas y *SVGO* para la optimización de gráficos vectoriales.

Como medida de coherencia estilística, se copió además el archivo `.editorconfig` del *boilerplate* original, asegurando la consistencia en el formato del código fuente a lo largo del proyecto.

== Control de calidad del código: Stylelint y Prettier

Con el objetivo de mantener un código limpio y homogéneo, se configuraron herramientas de validación y formateo. En primer lugar, se implementó *Stylelint* como sistema de *linting* para los archivos CSS y SCSS. Se instalaron las dependencias necesarias y se creó el fichero `.stylelintrc.json` con un conjunto de reglas adaptadas al uso de SCSS y la metodología BEM, que será analizada con más detalle en la sección siguiente.

```bash
npm install -D stylelint stylelint-config-standard-scss \
  stylelint-selector-bem-pattern
```

Adicionalmente, se incorporó *Prettier*, que aunque no formaba parte del *boilerplate* original, se consideró una herramienta esencial para asegurar la uniformidad en el estilo del código. Su configuración se realizó a través del archivo `.prettierrc`, sincronizado con las directrices definidas en `.editorconfig`.

Ambas herramientas comparten criterios de formato, entre los que destacan:

- Indentación de dos espacios.
- Uso de fin de línea tipo LF (Unix).
- Codificación de caracteres en UTF-8.
- Eliminación automática de los espacios en blanco finales.

Esta configuración unificada garantiza un entorno de desarrollo coherente y una base de código más legible y mantenible a largo plazo.

=== Comandos del proyecto

El `package.json` se configuró con los siguientes scripts:

- `npm run dev`: Servidor de desarrollo con HMR
- `npm run build`: Compilación para producción
- `npm run preview`: Preview del build de producción
- `npm run format`: Formatear código con Prettier
- `npm run format:check`: Verificar formato sin modificar
- `npm run lint:css`: Validar CSS/SCSS con Stylelint
- `npm run lint:css:fix`: Auto-corregir errores de Stylelint

=== Validación del entorno

Por último, se llevaron a cabo diversas pruebas de validación con el fin de comprobar el correcto funcionamiento del _boilerplate_. En primer lugar, se verificó el comportamiento de *Autoprefixer* utilizando características modernas de CSS y comprobando que se generaban correctamente los _vendor prefixes_. Posteriormente, se evaluó la optimización de imágenes mediante una compilación de prueba, confirmando que los archivos resultantes se procesaban de forma eficiente.

Asimismo, se introdujeron errores deliberados en los archivos SCSS para comprobar que *Stylelint* detectaba adecuadamente las infracciones definidas en las reglas de estilo. También se incluyó contenido HTML de prueba —como botones y otros elementos básicos— con el propósito de verificar el funcionamiento del procesamiento mediante *PostHTML*. Finalmente, se validó el correcto comportamiento del entorno de desarrollo, asegurando que la recarga en caliente (*HMR*, _Hot Module Replacement_) operara de manera fluida durante la edición de los archivos fuente.

== Instalación y configuración de dependencias

En general, el proceso de instalación de las dependencias resultó sencillo. En muchos casos, bastó con intentar utilizar determinadas características (como Sass) para que el propio Vite indicara el error correspondiente junto con el comando exacto necesario para instalar la dependencia faltante. En cuanto al resto de herramientas y _plugins_, su incorporación se realizó consultando la documentación oficial de cada una y siguiendo las instrucciones de configuración recomendadas.

=== Gestión de dependencias

#figure(
  table(
    columns: (auto, auto, 1fr),
    [*Dependencia*], [*Versión*], [*Propósito*],
    [`vite`], [`7.1.14`], [Bundler principal (rolldown-vite)],
    [`sass-embedded`], [`1.93.2`], [Preprocesador CSS],
    [`postcss-preset-env`], [`10.4.0`], [Polyfills CSS modernos],
    [`stylelint`], [`latest`], [Linter CSS/SCSS],
    [`prettier`], [`3.6.2`], [Formateo de código],
    [`sharp`], [`0.34.4`], [Optimización de imágenes],
    [`svgo`], [`4.0.0`], [Optimización de SVG],
  ),
  caption: [Dependencias principales del proyecto]
)

= Metodología CSS: BEM (Block Element Modifier)

Esta sección justifica la elección de BEM como metodología de arquitectura CSS y documenta su aplicación en el proyecto.

== Análisis de metodologías disponibles

En relación con las diversas arquitecturas y metodologías CSS analizadas, OOCSS se posiciona como una solución intermedia entre los enfoques utility-first y las metodologías orientadas a componentes como BEM. No obstante, esta aproximación presenta limitaciones significativas, particularmente la tendencia a generar una proliferación descontrolada de clases o la necesidad de crear clases excesivamente específicas para casos particulares, lo cual puede comprometer la mantenibilidad del código a largo plazo.

Por su parte, SMACSS podría resultar viable en el contexto de un sistema de diseño cerrado y bien definido. Sin embargo, su principal debilidad radica en la excesiva estratificación de la arquitectura CSS, especialmente en la distinción entre las capas de layout y module. Desde una perspectiva contemporánea de desarrollo, resulta más coherente adoptar un concepto unificado de "componente" que englobe tanto elementos como cards o headers, sin establecer distinciones innecesarias entre ellos, ya que ambos constituyen unidades funcionales equivalentes dentro de la interfaz.

ITCSS adolece de problemas similares a los de SMACSS, manifestando una organización excesivamente fragmentada en múltiples capas que dificulta la cohesión del sistema. Esta complejidad estructural puede obstaculizar tanto el desarrollo como el mantenimiento del código en proyectos reales.

En contraste, BEM emerge como la alternativa más sólida y pragmática para el desarrollo en contextos profesionales. BEM trasciende la mera definición de arquitectura para constituirse como una metodología integral de desarrollo. Su principal fortaleza reside en la cohesión que proporciona al estructurar el CSS en torno al concepto de bloque, equivalente al concepto de componente. Adicionalmente, su sistema de nomenclatura específico previene eficazmente los conflictos de especificidad, un problema recurrente en proyectos de envergadura. Por estas razones, BEM ha sido seleccionado como la metodología base para este proyecto.

== Justificación de la elección de BEM

En esta sección se llevará a cabo un análisis detallado de las ventajas que, tras un proceso de evaluación comparativa, condujeron a la elección definitiva de la metodología BEM como enfoque principal para la organización y estructuración del código.

=== Adecuación al tipo de proyecto

Un sitio web informativo dedicado a una ciudad se estructura, de forma natural, a partir de componentes claramente identificables, que pueden organizarse de la siguiente manera:

- Sección hero (`.hero`)
- Navegación (`.nav`)
- Footer con información (`.footer`)
- Card de noticias (`.news-card`)

La metodología *BEM* facilita la asignación de nombres precisos a cada uno de estos componentes, lo que contribuye a mantener un estilo coherente, modular y encapsulado, favoreciendo así la mantenibilidad y escalabilidad del proyecto.

=== Alineación con desarrollo orientado a componentes

La industria web ha evolucionado hacia arquitecturas basadas en componentes (React, Vue, Web Components). BEM se alinea bastante bien con esta filosofía:

- Cada bloque es un componente independiente
- Los elementos son las partes internas del componente
- Los modificadores representan variantes o estados

=== Compatibilidad con Sass nesting

Una de las grandes ventajas de BEM con Sass es la capacidad de usar nesting mientras se mantiene la nomenclatura clara:

```scss
.card {
  // Estilos del bloque
  
  &__header {
    // Compila a .card__header
  }
  
  &__body {
    // Compila a .card__body
  }
  
  &--featured {
    // Compila a .card--featured
  }
}
```

Esto ayuda a mantener el código organizado visualmente mientras se genera CSS plano con especificidad baja.

=== Experiencia previa y curva de aprendizaje

En asignaturas previas se ha trabajado con desarrollos orientados a componentes, particularmente con Angular, lo que ha permitido familiarizarse con la filosofía de componentes encapsulados y aislados que poseen sentido funcional por sí mismos. BEM constituye una extensión natural de este paradigma al ámbito del CSS, proporcionando una metodología de estilos que se alinea coherentemente con los conocimientos previamente adquiridos. Esta continuidad conceptual facilita significativamente su adopción, requiriendo una curva de aprendizaje mínima y permitiendo aplicar de manera consistente los principios de modularidad y encapsulación tanto en la lógica de los componentes como en su presentación visual.

=== Ventajas adicionales

- *Tooling*: BEM cuenta con excelente soporte en herramientas de análisis y validación de código como Stylelint, que dispone de plugins específicos diseñados para verificar el cumplimiento de las convenciones de nomenclatura y detectar posibles inconsistencias en la implementación de la metodología.

- *Comunidad*: La metodología ha sido ampliamente adoptada en la industria del desarrollo web, lo que se refleja en la disponibilidad de abundante documentación, tutoriales, ejemplos prácticos y casos de estudio que facilitan tanto el aprendizaje inicial como la resolución de problemas específicos durante el desarrollo.

- *Mantenibilidad*: La estructura de nomenclatura explícita de BEM permite identificar de manera inmediata y sin ambigüedad qué reglas CSS afectan a cada elemento específico de la interfaz, simplificando significativamente las tareas de mantenimiento y depuración del código.

- *Refactoring*: Las operaciones de refactorización se vuelven más seguras y predecibles gracias al sistema de nomenclatura específico, que permite realizar búsquedas y reemplazos de nombres de clase con confianza, minimizando el riesgo de efectos secundarios no deseados en componentes no relacionados.
== Aplicación de BEM en el proyecto

=== Nomenclatura y convenciones

El patrón BEM se aplicó siguiendo la convención estándar:

```
.block           → Componente independiente
.block__element  → Parte del componente
.block--modifier → Variante del componente o elemento
```

*Reglas aplicadas*:

1. Los nombres usan kebab-case (minúsculas con guiones): `.main-nav`, `.hero-section`
2. Un elemento siempre pertenece a un bloque: `.card__title`, nunca `.card__header__title`
3. Los modificadores pueden aplicarse a bloques o elementos: `.button--primary`, `.button__icon--large`

=== Reflexión sobre BEM y su vigencia en la actualidad

Como consideración adicional para futuras investigaciones, resulta pertinente explorar el desarrollo de arquitecturas CSS alternativas. Es fundamental que como profesionales en formación comprendamos estas arquitecturas y metodologías dentro de su contexto histórico específico. La evolución reciente del estándar CSS, particularmente con la incorporación nativa de CSS Nesting y la directiva `@layer`, abre nuevas posibilidades arquitectónicas. Estos avances sugieren que sería factible desarrollar una arquitectura más simplificada que BEM, manteniendo simultáneamente niveles equivalentes de cohesión y capacidad para prevenir problemas de especificidad, adaptándose así a las capacidades actuales del lenguaje.

= Configuración de Stylelint

Esta sección documenta en detalle la configuración de Stylelint, incluyendo plugins, reglas personalizadas y el proceso de validación.

== Plugins y extensiones instaladas

Se instalaron las siguientes dependencias relacionadas con Stylelint:

```bash
npm install -D stylelint \
  stylelint-config-standard-scss \
  stylelint-selector-bem-pattern \
  stylelint-scss
```

La dependencia `stylelint-config-standard-scss` proporciona una configuración base que extiende las reglas estándar de Stylelint específicamente adaptadas para archivos SCSS. Esta configuración abarca reglas de formato como indentación, espaciado y uso de comillas, así como validación de sintaxis SCSS, detección de errores comunes y aplicación de buenas prácticas de desarrollo.

El plugin `stylelint-selector-bem-pattern` resulta fundamental para validar la correcta aplicación de la nomenclatura BEM en los selectores de clase, permitiendo definir patrones mediante expresiones regulares que deben cumplir todas las clases CSS del proyecto.

Finalmente, `stylelint-scss` añade soporte específico para las características avanzadas de Sass/SCSS, incluyendo la validación de directivas como `@import`, `@use` y `@forward`, así como reglas para at-rules personalizadas y validación de funciones y mixins propios del preprocesador.

== Configuración de `.stylelintrc.json`

El archivo de configuración se estructuró de la siguiente manera:

```json
{
  "extends": ["stylelint-config-standard-scss"],
  "plugins": ["stylelint-selector-bem-pattern"]
}
```

Se ha validado que con esta configuración básica, Stylelint ya aplica un conjunto sólido de reglas para mantener la calidad del código CSS/SCSS, incluyendo la validación de la sintaxis SCSS y la aplicación de buenas prácticas generales y reglas BEM.

== Proceso de validación

=== Comandos de linting

Se configuraron dos comandos en `package.json`:

```json
{
  "scripts": {
    "lint:css": "stylelint \"**/*.{css,scss}\"",
    "lint:css:fix": "stylelint \"**/*.{css,scss}\" --fix"
  }
}
```

- `npm run lint:css`: Valida sin modificar archivos
- `npm run lint:css:fix`: Auto-corrige errores cuando es posible

=== Ejemplo de validación

#figure(image("images/stylelint-error.jpg"), caption: [
  Error de Stylelint detectado por nomenclatura BEM
])

Al ejecutar `npm run lint:css`, Stylelint analiza todos los archivos CSS/SCSS y reporta:

=== Auto-corrección

Stylelint incorpora capacidades de auto-corrección que permiten resolver automáticamente numerosos errores de formato y estilo mediante la opción `--fix`. Entre las correcciones automáticas más comunes se encuentran la simplificación de valores hexadecimales de color (por ejemplo, transformando `#FF0000` en `#F00` según la regla `color-hex-length`), la eliminación de unidades innecesarias en valores nulos (convirtiendo `margin: 0px` en `margin: 0` mediante `length-zero-no-unit`), la normalización del espaciado inconsistente y la reorganización del orden de las declaraciones CSS conforme a las convenciones establecidas.

No obstante, existen errores que requieren intervención manual del desarrollador, particularmente aquellos relacionados con aspectos estructurales o semánticos del código. Entre estos se incluyen los nombres de clase que no se ajustan a la nomenclatura BEM, los selectores que presentan problemas de especificidad y las reglas CSS duplicadas, casos en los que la herramienta únicamente señala el problema sin proporcionar una solución automática.

= Características de Sass implementadas

Para llevar a cabo la implementación de la página web, se han empleado diversas características de Sass que han facilitado el desarrollo y mantenibilidad del código CSS, permitiendo una estructura modular coherente con la metodología BEM adoptada.

== Variables Sass

Se utilizaron variables Sass para mantener consistencia y facilitar el mantenimiento del código. El archivo `_variables.scss` centraliza todas las definiciones:

```scss
$color-primary: #0077be;        // Azul océano
$color-secondary: #e8d5b7;      // Arena
$color-accent: #2d5c3f;         // Verde subtropical
$color-detail: #c65d3b;         // Terracota
$color-text: #333;
$color-text-light: #666;
$color-bg: #fff;
$color-bg-alt: #f5f5f5;

// ...
```

== Anidado (Nesting)

El anidado de Sass se utilizó extensivamente, especialmente en combinación con BEM. A continuación se muestra un ejemplo real del componente hero:

```scss
.hero {
  position: relative;
  display: flex;
  
  // ...

  // Media queries anidadas
  @media (width >= 768px) {
    min-block-size: 80vh;
  }

  // Elementos BEM anidados
  &__content {
    z-index: 1;
    text-align: center;
  }

  &__title {
    color: $color-bg;
    margin-block-end: $space-md;
    text-shadow: $shadow-lg;
  }
}
```

Este enfoque de anidado mantiene la estructura BEM mientras agrupa visualmente el código relacionado.

== Funciones personalizadas

El proyecto no requirió funciones Sass personalizadas complejas, pero se aprovecharon las funciones nativas de CSS modernas que PostCSS transpila para compatibilidad con navegadores más antiguos. En concreto, se ha hecho uso de la función `color-mix()` para crear variantes de color dinámicas y de `clamp()` para definir tamaños de fuente fluidos.

```scss
.nav__logo {
  color: $color-primary;
  
  &:hover {
    color: color-mix(in oklch, $color-primary 80%, black);
  }
}
```

En este caso, se utiliza la función nativa de CSS `color-mix()` (transformada durante la compilación mediante PostCSS para garantizar la compatibilidad con navegadores) junto con el moderno espacio de color OKLCH para oscurecer el color primario en el estado hover. La ventaja de emplear OKLCH en este contexto radica en que proporciona una interpolación perceptualmente uniforme, generando transiciones de color más naturales y consistentes en comparación con espacios de color tradicionales como HSL. Esto resulta en un oscurecimiento más predecible y visualmente coherente, donde la percepción humana del cambio de luminosidad se mantiene constante independientemente del tono del color base.

```scss
$font-size-h1: clamp(2rem, 5vw, 3.5rem);
$font-size-h2: clamp(1.75rem, 4vw, 2.5rem);
```

La función `clamp()` establece un tamaño de fuente fluido que se adapta responsivamente al viewport, definiendo tres valores: un tamaño mínimo, un tamaño preferido basado en el ancho del viewport, y un tamaño máximo. En el primer ejemplo, el tamaño del `h1` nunca será inferior a `2rem` ni superior a `3.5rem`, ajustándose dinámicamente a `5vw` (5% del ancho del viewport) cuando este valor se encuentre entre ambos límites. Esto elimina la necesidad de utilizar media queries para adaptar la tipografía a diferentes tamaños de pantalla, proporcionando una escalabilidad fluida y automática que mejora tanto la legibilidad como la experiencia responsive del diseño.

== Parciales e importación

El código Sass se organizó en parciales siguiendo una arquitectura modular:

```
src/
├── assets/
│   └── styles/
│       ├── _variables.scss     # Variables globales (colores, espaciado, etc.)
│       ├── _base.scss          # Estilos base y reset
│       ├── _layout.scss        # Sistema de layout y contenedores
│       ├── _nav.scss           # Componente navegación
│       ├── _hero.scss          # Componente hero
│       ├── _sections.scss      # Secciones de contenido
│       └── _footer.scss        # Componente footer
└── style.scss                  # Archivo principal que importa todo
```

El archivo principal `style.scss` importa todos los parciales utilizando la sintaxis moderna `@use`:

```scss
@use "assets/styles/variables";
@use "assets/styles/base";
@use "assets/styles/layout";
@use "assets/styles/nav";
@use "assets/styles/hero";
@use "assets/styles/sections";
@use "assets/styles/footer";
@import "modern-normalize/modern-normalize.css";
@import "@fortawesome/fontawesome-free/css/all.min.css";
```

Dentro de cada parcial se importan las dependencias necesarias:

```scss
// Ejemplo de _hero.scss
@use "variables" as *;
@use "layout" as *;

.hero {
  // Estilos del componente
}
```

La sintaxis `as *` permite usar las variables sin prefijo, mientras que `@use` sin `as *` requeriría prefijo (ej: `variables.$color-primary`).

== Mixins

Se creó un mixin fundamental para el sistema de layout del proyecto: `container-base`, que maneja los contenedores responsive:

```scss
@mixin container-base {
  inline-size: 100%;
  margin-inline: auto;
  padding-inline: $space-sm;

  @media (width >= 640px) {
    max-inline-size: $container-sm;
  }

  @media (width >= 768px) {
    max-inline-size: $container-md;
    padding-inline: $space-md;
  }

  @media (width >= 1024px) {
    max-inline-size: $container-lg;
    padding-inline: $space-lg;
  }

  @media (width >= 1280px) {
    max-inline-size: $container-xl;
  }
}
```

Este mixin se utiliza extensivamente en todo el proyecto para mantener consistencia en los anchos de contenedor:

```scss
// Ejemplo en _hero.scss
.hero__content {
  @include container-base;
  z-index: 1;
  text-align: center;
}

// Ejemplo en _sections.scss
.section__container {
  @include container-base;
}
```

= Diseño responsive

Esta sección documenta la estrategia responsive implementada en el proyecto, incluyendo el enfoque mobile-first, los breakpoints definidos y las técnicas empleadas para garantizar una experiencia óptima en todos los dispositivos.

== Enfoque Mobile-First

El proyecto adoptó un enfoque mobile-first, donde los estilos base se definen para dispositivos móviles y posteriormente se añaden adaptaciones para pantallas más grandes mediante media queries. Esta aproximación se fundamenta en las siguientes razones:

1. *Priorización de contenido*: El diseño mobile-first obliga a identificar y priorizar los elementos esenciales de la interfaz, eliminando elementos superfluos y centrándose en la experiencia del usuario.

2. *Progressive enhancement*: Se añaden features y complejidad visual progresivamente para pantallas más grandes, garantizando que la experiencia base funcione en todos los dispositivos.

3. *Tendencia actual del tráfico web*: La mayoría del tráfico web proviene de dispositivos móviles, por lo que priorizar esta experiencia resulta coherente con los patrones de uso reales.

== Breakpoints definidos

El proyecto define breakpoints utilizando la sintaxis moderna de CSS con comparaciones de rangos, que PostCSS transpila para compatibilidad con navegadores que no la soportan aún:

```scss
// Breakpoints principales
640px   // Móviles grandes / tablets pequeñas
768px   // Tablets
1024px  // Desktop / laptops
1280px  // Desktop grande
```

Estos valores se emplean consistentemente en todo el código mediante media queries:

```scss
// Ejemplo del mixin container-base
@media (width >= 640px) {
  max-inline-size: $container-sm;
}

@media (width >= 768px) {
  max-inline-size: $container-md;
  padding-inline: $space-md;
}

@media (width >= 1024px) {
  max-inline-size: $container-lg;
  padding-inline: $space-lg;
}

@media (width >= 1280px) {
  max-inline-size: $container-xl;
}
```

La sintaxis `(width >= 768px)` es más legible y expresiva que la tradicional `(min-width: 768px)`, alineándose con las especificaciones modernas de CSS Media Queries Level 4.

== Técnicas responsive implementadas

=== Tipografía fluida con clamp()

Se utilizó la función `clamp()` para crear escalas tipográficas que se adaptan fluidamente al viewport:

```scss
$font-size-h1: clamp(2rem, 5vw, 3.5rem);
$font-size-h2: clamp(1.75rem, 4vw, 2.5rem);
$font-size-h3: clamp(1.5rem, 3vw, 2rem);
```

Esta técnica elimina la necesidad de múltiples media queries para ajustar tamaños de fuente.

=== Layouts adaptativos con CSS Grid

Se empleó CSS Grid para crear layouts que se adaptan automáticamente según el espacio disponible:

```scss
.landscapes__grid {
  display: grid;
  grid-template-columns: 1fr;  // Móvil: 1 columna
  
  @media (width >= 768px) {
    grid-template-columns: repeat(2, 1fr);  // Tablet: 2 columnas
  }
  
  @media (width >= 1024px) {
    grid-template-columns: repeat(3, 1fr);  // Desktop: 3 columnas
  }
}
```

= Compilación para producción

El proceso de construcción (build) para generar la versión de producción del proyecto resulta sumamente sencillo, requiriendo únicamente la ejecución del comando `npm run build`, que compila y optimiza automáticamente todos los recursos necesarios para el despliegue en producción.

El proceso de build ejecuta:

1. Transpilación de Sass a CSS
2. PostCSS con autoprefixer y preset-env
3. Minificación de CSS con esbuild
4. Minificación de HTML
5. Optimización de imágenes (Sharp, SVGO)
6. Minificación de JavaScript
7. Generación de source maps
8. Output en carpeta `dist/`

= Publicación

== Repositorio en GitHub

TODO

*URL del repositorio*: TODO

== Deployment en Netlify

TODO

=== Configuración del deployment

TODO

=== URL pública

TODO

=== Verificación

TODO

= Decisiones adicionales de diseño y desarrollo

TODO

== Dependencias externas añadidas

TODO

== Accesibilidad

TODO

= Conclusiones

TODO

== Objetivos alcanzados

TODO

== Aprendizajes clave

TODO

== Retos encontrados y soluciones

TODO

== Posibles mejoras futuras

TODO

#bibliography("./references.bib")
