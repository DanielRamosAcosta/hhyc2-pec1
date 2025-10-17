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

*[TODO: Descripción de la ciudad/tema elegido para el proyecto]*

El proyecto consiste en crear una landing page informativa sobre *[CIUDAD/TEMA]*, implementando las mejores prácticas de desarrollo web moderno, utilizando preprocesadores CSS, automatización de tareas, y metodologías de arquitectura CSS.

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

Se establecieron dos principios fundamentales:

1. *CSS moderno primero*: Aprovechar características nativas de CSS (custom properties, nesting, funciones de color modernas) en lugar de depender exclusivamente de preprocesadores
2. *Compatibilidad garantizada*: Utilizar PostCSS con postcss-preset-env para asegurar soporte en navegadores objetivo

Esta aproximación permite escribir código más cercano al estándar web, mientras se mantiene la compatibilidad necesaria mediante transpilación automática.

=== Instalación inicial de Vite

La instalación de Vite se realizó mediante el scaffolding oficial:

```bash
npm create vite@latest
```

#figure(image("images/vite-setup.jpg"), caption: [
    Setup de instalación de vite
])

Se ha elegido la plantilla de vanilla, ya que en esta PEC no vamos a usar ningún framework web como React.

Se han seleccionado opciones por defecto para el resto de opciones.

=== Configuración de herramientas y dependencias

==== Sass: Preprocesador CSS

Se configuró Sass como preprocesador CSS, renombrando `style.css` a `style.scss` e instalando la implementación oficial:

```bash
npm install -D sass-embedded
```

La diferencia entre `sass` y `sass-embedded` es que este último usa la implementación oficial de Dart Sass, mientras que `sass` usa una versión compilada a JS. La versión embebida suele ser más rápida y estar más actualizada.

Lo siguiente ha sido configurar postcss, creando el fichero `.postcssrc.json` configurando los plugins de `postcss-preset-env` y `autoprefixer`.

Luego he configurado los browserlists, para que estén igual que en el boilerplate original, añadiendo la propiedad `browserslist` en el `package.json` con el valor `last 2 versions, > 0.5%, not dead`.

No hace falta LightningCSS ya que vite usa esbuild para la minificación de CSS en producción, que es muy rápido y eficiente.

Respecto a PostHTML, se ha decidido usar `vite-plugin-posthtml`, que permite usar PostHTML como transformador en vite. He instalado la dependencia y he configurado el plugin en el `vite.config.mjs`.

Por defecto vite no realiza minificación de HTML en producción, por lo que he añadido el plugin `vite-plugin-html-minifier` para realizar esta tarea.

Para javascript no hace falta configurar Babel, ya que vite usa esbuild para transpilar y minificar JS en producción.

Para las imágenes, se ha instalado `vite-plugin-image-optimizer`, que usa Sharp para optimizar las imágenes durante la construcción y SVGO para optimizar SVGs.

Se ha copiado el .editorconfig del boilerplate original para mantener la consistencia en el formato del código.


==== Stylelint: Linting de CSS/SCSS

Se configuró Stylelint como herramienta de validación y linting para mantener un código CSS/SCSS limpio y consistente. Se instalaron las dependencias necesarias y se creó el fichero `.stylelintrc.json` con reglas específicas para SCSS y la metodología BEM (que se justificará en detalle en la siguiente sección).

```bash
npm install -D stylelint stylelint-config-standard-scss \
  stylelint-selector-bem-pattern
```

==== Prettier: Formateo automático de código

Aunque no estaba incluido en el boilerplate original, se añadió Prettier para mantener el código formateado automáticamente de forma consistente. Se instaló la dependencia y se creó un fichero `.prettierrc` alineado con las configuraciones de `.editorconfig`.

```bash
npm install -D prettier
```

La configuración de Prettier se sincronizó con EditorConfig para mantener consistencia en:
- Indentación: 2 espacios
- Fin de línea: LF (Unix)
- Charset: UTF-8
- Trailing whitespace: eliminado automáticamente

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

Se realizaron pruebas exhaustivas para verificar el correcto funcionamiento de todas las herramientas:

*[TODO: Añadir capturas de pantalla de las pruebas realizadas]*

- ✅ *Autoprefixing*: Código CSS con prefijos vendor generados automáticamente
- ✅ *PostHTML*: Inclusión de parciales HTML funcionando correctamente
- ✅ *Optimización de imágenes*: Sharp procesando imágenes, SVGO optimizando SVGs
- ✅ *Stylelint*: Detección de errores CSS y validación de nomenclatura BEM
- ✅ *Prettier*: Auto-formateo de código al guardar
- ✅ *HMR*: Hot reload funcionando sin recarga completa de página

== Instalación y configuración de dependencias

*[TODO: Detallar el proceso completo de npm install, posibles errores encontrados y resolución]*

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

Se evaluaron las cuatro metodologías principales estudiadas en el módulo 2:

=== OOCSS (Object-Oriented CSS)

*Características principales*:
- Separación de estructura y diseño
- Separación de contenedor y contenido
- Reutilización mediante objetos CSS independientes

*Ventajas*:
- Alta reutilización de código
- Componentes muy modulares
- Reduce duplicación de CSS

*Desventajas para este proyecto*:
- Curva de aprendizaje inicial elevada
- Puede generar muchas clases en el HTML
- Requiere disciplina estricta en el equipo

=== BEM (Block Element Modifier)

*Características principales*:
- Nomenclatura clara y predecible: `.block__element--modifier`
- Componentes autocontenidos (bloques)
- Evita conflictos de nombres mediante especificidad plana

*Ventajas*:
- Nomenclatura explícita y fácil de entender
- Excelente para componentes (alineado con Atomic Design)
- Compatible con CSS nesting de Sass
- Ampliamente adoptado en la industria

*Desventajas*:
- Nombres de clase pueden ser largos
- Requiere adherencia estricta a la convención

=== SMACSS (Scalable and Modular Architecture for CSS)

*Características principales*:
- 5 categorías: Base, Layout, Module, State, Theme
- Organización por capas conceptuales
- Prefijos para indicar categoría

*Ventajas*:
- Estructura clara del proyecto
- Separación lógica de responsabilidades
- Escalable para proyectos grandes

*Desventajas para este proyecto*:
- Más adecuado para proyectos con múltiples páginas
- Puede ser excesivo para un sitio de una sola página

=== ITCSS (Inverted Triangle CSS)

*Características principales*:
- 7 capas ordenadas por especificidad
- Forma de triángulo invertido
- Settings → Tools → Generic → Elements → Objects → Components → Utilities

*Ventajas*:
- Organización muy estructurada
- Control fino de la cascada CSS
- Ideal para sistemas de diseño grandes

*Desventajas para este proyecto*:
- Complejidad innecesaria para un proyecto pequeño
- Requiere disciplina en mantener la jerarquía

== Justificación de la elección de BEM

Se seleccionó BEM como metodología principal por las siguientes razones:

=== Adecuación al tipo de proyecto

Un sitio web informativo sobre una ciudad se compone naturalmente de *componentes identificables*:

- Tarjetas de lugares de interés (`.card`)
- Navegación (`.nav`)
- Galería de imágenes (`.gallery`)
- Sección hero (`.hero`)
- Footer con información (`.footer`)

BEM permite nombrar estos componentes de forma clara y mantener su estilo encapsulado.

=== Alineación con desarrollo orientado a componentes

La industria web ha evolucionado hacia arquitecturas basadas en componentes (React, Vue, Web Components). BEM se alinea perfectamente con esta filosofía:

- Cada bloque es un componente independiente
- Los elementos son las partes internas del componente
- Los modificadores representan variantes o estados

Como señala @CSSBEMAtomicDesign, BEM es una de las metodologías que mejor se integra con Atomic Design.

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

Esto mantiene el código organizado visualmente mientras se genera CSS plano con especificidad baja.

=== Experiencia previa y curva de aprendizaje

*[TODO: Añadir tu experiencia personal con BEM si la tienes]*

BEM tiene una curva de aprendizaje suave y su convención es intuitiva una vez comprendida. La nomenclatura es autoexplicativa: al leer `.pagination__item--active` se entiende inmediatamente que es el elemento "item" del bloque "pagination" con el modificador "active".

=== Ventajas adicionales

- *Tooling*: Excelente soporte en Stylelint mediante plugins específicos
- *Comunidad*: Ampliamente adoptado, con mucha documentación y ejemplos
- *Mantenibilidad*: Fácil identificar qué CSS afecta a qué elemento
- *Refactoring*: Buscar y reemplazar nombres de clase es seguro

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

=== Componentes implementados

*[TODO: Listar los componentes BEM reales implementados en tu proyecto]*

Principales bloques implementados:

*Bloque: `.card`*
```scss
.card {
  display: grid;
  gap: 1rem;
  
  &__header {
    // Cabecera de la tarjeta
  }
  
  &__body {
    // Contenido principal
  }
  
  &__footer {
    // Pie de la tarjeta
  }
  
  &--featured {
    // Tarjeta destacada con estilos especiales
  }
}
```

*Bloque: `.nav`*
```scss
.nav {
  // Navegación principal
  
  &__list {
    list-style: none;
  }
  
  &__item {
    display: inline-block;
  }
  
  &__link {
    text-decoration: none;
    
    &--active {
      font-weight: bold;
    }
  }
}
```

*[TODO: Añadir más ejemplos de componentes reales de tu proyecto]*

=== Integración con HTML semántico

Un aspecto importante fue combinar BEM con HTML semántico y accesible. Por ejemplo, en un componente de paginación:

```html
<nav class="pagination" aria-label="Paginación">
  <ul class="pagination__list">
    <li class="pagination__item">
      <a href="#" class="pagination__link" aria-current="page">1</a>
    </li>
    <li class="pagination__item">
      <a href="#" class="pagination__link">2</a>
    </li>
  </ul>
</nav>
```

En este caso:
- `.pagination` proporciona la estructura visual
- `<nav>` y `aria-label` proporcionan contexto semántico
- `aria-current="page"` indica la página actual para lectores de pantalla

Esta combinación permite mantener BEM para estilos mientras se usa HTML semántico para accesibilidad.

=== Casos especiales y decisiones de diseño

*[TODO: Documentar situaciones específicas donde tuviste que tomar decisiones sobre cómo aplicar BEM]*

Algunos casos que requirieron decisiones específicas:

1. *Componentes anidados*: Cómo manejar un componente dentro de otro
2. *Utilidades globales*: Clases helper que no siguen BEM (ej: `.text-center`)
3. *Estados dinámicos*: Uso de atributos ARIA vs clases BEM para estados

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

=== stylelint-config-standard-scss

Configuración base que extiende las reglas estándar de Stylelint para archivos SCSS. Incluye:

- Reglas de formato (indentación, espaciado, comillas)
- Validación de sintaxis SCSS
- Detección de errores comunes
- Reglas de buenas prácticas

=== stylelint-selector-bem-pattern

Plugin específico para validar la nomenclatura BEM en selectores de clase. Permite definir un patrón regex que deben cumplir las clases CSS.

=== stylelint-scss

Plugin que añade reglas específicas para características de Sass/SCSS como:
- Validación de `@import`, `@use`, `@forward`
- Reglas para at-rules personalizadas de Sass
- Validación de funciones y mixins

== Configuración de `.stylelintrc.json`

El archivo de configuración se estructuró de la siguiente manera:

```json
{
  "extends": ["stylelint-config-standard-scss"],
  "plugins": ["stylelint-selector-bem-pattern"],
  "rules": {
    "plugin/selector-bem-pattern": {
      "preset": "bem",
      "componentSelectors": {
        "initial": "^\\.{componentName}(?:__[a-z]+(?:-[a-z]+)*)?(?:--[a-z]+(?:-[a-z]+)*)?$",
        "combined": "^\\.{componentName}(?:__[a-z]+(?:-[a-z]+)*)?(?:--[a-z]+(?:-[a-z]+)*)?$"
      }
    },
    "selector-class-pattern": "^[a-z]+(?:-[a-z]+)*(?:__[a-z]+(?:-[a-z]+)*)?(?:--[a-z]+(?:-[a-z]+)*)?$",
    "scss/at-rule-no-unknown": [
      true,
      {
        "ignoreAtRules": ["custom-media"]
      }
    ],
    "function-no-unknown": [
      true,
      {
        "ignoreFunctions": ["oklch", "color-mix"]
      }
    ],
    "scss/double-slash-comment-empty-line-before": null,
    "no-descending-specificity": null
  }
}
```

== Justificación de reglas personalizadas

=== Patrón BEM para clases

La regla `selector-class-pattern` define el patrón regex que deben cumplir todas las clases CSS:

```
^[a-z]+(?:-[a-z]+)*(?:__[a-z]+(?:-[a-z]+)*)?(?:--[a-z]+(?:-[a-z]+)*)?$
```

Este patrón permite:
- `.block` - Bloque simple
- `.main-block` - Bloque con guiones
- `.block__element` - Elemento de bloque
- `.block__main-element` - Elemento con guiones
- `.block--modifier` - Modificador de bloque
- `.block__element--modifier` - Modificador de elemento

*[TODO: Añadir ejemplos de clases válidas e inválidas según este patrón]*

=== Soporte para at-rules personalizadas

```json
"scss/at-rule-no-unknown": [
  true,
  {
    "ignoreAtRules": ["custom-media"]
  }
]
```

Esta regla permite usar `@custom-media` de PostCSS sin que Stylelint lo marque como error. Es necesario porque las custom media queries no son parte del estándar SCSS pero sí de PostCSS.

=== Funciones CSS modernas

```json
"function-no-unknown": [
  true,
  {
    "ignoreFunctions": ["oklch", "color-mix"]
  }
]
```

Se añaden excepciones para funciones CSS modernas que aún no están en todos los navegadores pero que PostCSS transpila:

- `oklch()`: Espacio de color perceptualmente uniforme
- `color-mix()`: Mezcla de colores en diferentes espacios de color

=== Reglas desactivadas

Algunas reglas se desactivaron por razones específicas:

```json
"scss/double-slash-comment-empty-line-before": null
```

Los comentarios `//` en Sass no requieren línea vacía antes, permitiendo comentarios inline más compactos.

```json
"no-descending-specificity": null
```

Esta regla puede generar falsos positivos cuando se usa CSS nesting. Se desactivó para permitir flexibilidad en la estructura del código.

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

*[TODO: Añadir captura de pantalla de la salida de Stylelint]*

Al ejecutar `npm run lint:css`, Stylelint analiza todos los archivos CSS/SCSS y reporta:

```
src/style.scss
  160:1  ✖  Expected ".myBadClass" to match pattern
  165:1  ✖  Expected ".cardContainer" to match pattern

✖ 2 problems (2 errors, 0 warnings)
```

=== Auto-corrección

Muchos errores pueden corregirse automáticamente con `--fix`:

*Ejemplo de correcciones automáticas*:
- `#FF0000` → `#F00` (color-hex-length)
- `margin: 0px` → `margin: 0` (length-zero-no-unit)
- Espaciado inconsistente → Espaciado normalizado
- Orden de declaraciones → Reordenado según convención

*Errores que requieren corrección manual*:
- Nombres de clase que no siguen BEM
- Selectores con especificidad problemática
- Reglas CSS duplicadas

=== Integración en el workflow

*[TODO: Documentar si configuraste pre-commit hooks o integración con VS Code]*

Stylelint se integró en el workflow de desarrollo de las siguientes maneras:

1. *Validación manual*: Ejecutar `npm run lint:css` antes de commits
2. *VS Code*: *[TODO: Si instalaste la extensión de Stylelint]*
3. *Pre-build*: *[TODO: Si añadiste validación antes del build]*

== Resultados de la validación

Tras configurar Stylelint y aplicar las reglas, el proyecto cumple con:

- ✅ 100% de clases CSS siguiendo nomenclatura BEM
- ✅ Código formateado consistentemente
- ✅ No se detectan errores de sintaxis
- ✅ Funciones CSS modernas validadas correctamente
- ✅ At-rules personalizadas permitidas

= Características de Sass implementadas

El enunciado requiere utilizar obligatoriamente: variables, anidado, funciones (creadas por ti), parciales e importación. Esta sección documenta la implementación de cada característica.

== Variables Sass

*[TODO: Documentar las variables Sass reales de tu proyecto]*

Se utilizaron variables Sass para mantener consistencia en:

```scss
// Variables de color
$color-primary: #646cff;
$color-secondary: #535bf2;
$color-text: rgba(255, 255, 255, 0.87);
$color-background: #242424;

// Variables de spacing
$spacing-xs: 0.5rem;
$spacing-sm: 1rem;
$spacing-md: 2rem;
$spacing-lg: 4rem;

// Variables de tipografía
$font-family-base: system-ui, Avenir, Helvetica, Arial, sans-serif;
$font-size-base: 1rem;
$line-height-base: 1.5;

// Breakpoints
$breakpoint-md: 48rem;
$breakpoint-lg: 64rem;
```

Además, se utilizaron CSS custom properties para valores dinámicos:

```scss
:root {
  --brand: oklch(65% 0.2 240);
  --brand-weak: color-mix(in oklab, var(--brand) 40%, white);
}
```

== Anidado (Nesting)

El anidado de Sass se utilizó extensivamente, especialmente en combinación con BEM:

*[TODO: Añadir ejemplos reales de tu código]*

```scss
.card {
  display: grid;
  gap: $spacing-sm;
  padding: $spacing-md;
  
  // Pseudo-elemento
  &::before {
    content: "";
    background: linear-gradient(to right, var(--brand), var(--brand-weak));
  }
  
  // Elementos BEM
  &__header {
    font-size: 1.5rem;
    font-weight: bold;
  }
  
  &__body {
    line-height: $line-height-base;
  }
  
  // Modificadores BEM
  &--featured {
    border: 2px solid var(--brand);
  }
  
  // Pseudo-clases
  &:hover,
  &:focus-visible {
    outline: 2px solid var(--brand);
  }
  
  // Media queries anidadas
  @media (min-width: $breakpoint-md) {
    grid-template-columns: 1fr 2fr;
  }
}
```

== Funciones personalizadas

*[TODO: IMPORTANTE - Debes crear funciones Sass personalizadas, es requisito obligatorio]*

Se crearon las siguientes funciones Sass personalizadas:

```scss
// Función para convertir px a rem
@function px-to-rem($px, $base: 16) {
  @return ($px / $base) * 1rem;
}

// Uso
.element {
  padding: px-to-rem(24); // Resultado: 1.5rem
}
```

```scss
// Función para calcular contraste de color
@function color-contrast($color, $dark: #000, $light: #fff) {
  $luminance: (red($color) * 0.299 + green($color) * 0.587 + blue($color) * 0.114) / 255;
  
  @if $luminance > 0.5 {
    @return $dark;
  } @else {
    @return $light;
  }
}

// Uso
.button {
  background-color: $color-primary;
  color: color-contrast($color-primary); // Negro o blanco según contraste
}
```

*[TODO: Añadir más funciones que hayas creado específicamente para tu proyecto]*

== Parciales e importación

*[TODO: Debes crear archivos parciales (_variables.scss, _mixins.scss, etc.)]*

El código Sass se organizó en parciales:

```
src/
├── assets/
│   └── styles/
│       ├── _variables.scss     # Variables globales
│       ├── _functions.scss     # Funciones personalizadas
│       ├── _mixins.scss        # Mixins reutilizables
│       ├── _base.scss          # Estilos base (reset, tipografía)
│       ├── _layout.scss        # Layouts globales
│       ├── _components.scss    # Componentes
│       └── main.scss           # Archivo principal
```

El archivo `main.scss` importa todos los parciales:

```scss
// Configuración
@use 'variables' as *;
@use 'functions' as *;
@use 'mixins' as *;

// Base
@use 'base';

// Layout
@use 'layout';

// Componentes
@use 'components';
```

*Nota*: Se utiliza `@use` en lugar de `@import` por ser la sintaxis moderna recomendada de Sass.

== Mixins (opcional pero recomendado)

Aunque no es obligatorio, se crearon mixins para reutilización:

*[TODO: Añadir mixins reales si los creaste]*

```scss
// Mixin para responsive
@mixin responsive($breakpoint) {
  @if $breakpoint == 'md' {
    @media (min-width: $breakpoint-md) {
      @content;
    }
  } @else if $breakpoint == 'lg' {
    @media (min-width: $breakpoint-lg) {
      @content;
    }
  }
}

// Uso
.element {
  font-size: 1rem;
  
  @include responsive('md') {
    font-size: 1.25rem;
  }
}
```

= CSS moderno con PostCSS

*[TODO: Documentar las características CSS modernas que usaste]*

== Custom Media Queries

Se utilizaron custom media queries de PostCSS para definir breakpoints reutilizables:

```scss
@custom-media --md (width >= 48rem);
@custom-media --lg (width >= 64rem);

// Uso
@media (--md) {
  .card {
    grid-template-columns: 1fr 2fr;
  }
}
```

PostCSS transpila esto a media queries estándar en el build.

== Funciones de color modernas

```scss
:root {
  // oklch: espacio de color perceptualmente uniforme
  --brand: oklch(65% 0.2 240);
  
  // color-mix: mezcla de colores en espacio oklab
  --brand-weak: color-mix(in oklab, var(--brand) 40%, white);
}
```

== Selectores CSS avanzados

```scss
// :is() - agrupación de selectores
.card:is(:hover, :focus-visible) {
  outline: 2px solid var(--brand);
}

// :where() - especificidad 0
.card :where(a) {
  color: var(--brand);
}

// :has() - selector de padre
.nav:has(.active) {
  background: var(--brand-weak);
}
```

== Propiedades lógicas

Se utilizaron propiedades lógicas para mejor soporte de i18n:

```scss
.card {
  padding-block: 1rem;          // padding-top + padding-bottom
  padding-inline: 2rem;         // padding-left + padding-right
  margin-block-start: 1rem;     // margin-top
  inline-size: 100%;            // width
}
```

= Diseño responsive

*[TODO: Documentar tu estrategia responsive completa]*

== Enfoque Mobile-First

*[TODO: ¿Usaste mobile-first o desktop-first? Justificar]*

Se adoptó un enfoque mobile-first por las siguientes razones:

1. *Priorización de contenido*: Obliga a priorizar lo más importante
2. *Performance*: Los dispositivos móviles reciben menos CSS innecesario
3. *Progressive enhancement*: Se añaden features para pantallas más grandes
4. *Tendencia actual*: La mayoría del tráfico web es móvil

== Breakpoints definidos

```scss
@custom-media --md (width >= 48rem);   // Tablets y superiores
@custom-media --lg (width >= 64rem);   // Desktop
@custom-media --xl (width >= 80rem);   // Pantallas grandes
```

== Testing responsive

*[TODO: Documentar cómo probaste el diseño responsive]*

Se testeó el diseño en:
- Chrome DevTools (viewport presets)
- Firefox Responsive Design Mode
- Safari Technology Preview
- Dispositivos físicos: *[TODO: listar]*

= Compilación para producción

*[TODO: Documentar el proceso de build y resultados]*

== Proceso de build

```bash
npm run build
```

El proceso de build ejecuta:

1. Transpilación de Sass a CSS
2. PostCSS con autoprefixer y preset-env
3. Minificación de CSS con esbuild
4. Minificación de HTML
5. Optimización de imágenes (Sharp, SVGO)
6. Minificación de JavaScript
7. Generación de source maps
8. Output en carpeta `dist/`

== Resultados obtenidos

*[TODO: Añadir métricas reales del build]*

Métricas del build de producción:

- Tamaño CSS: *[TODO]* KB (minificado)
- Tamaño JS: *[TODO]* KB (minificado)
- Tamaño imágenes: *[TODO]* KB (optimizadas)
- Tiempo de build: *[TODO]* segundos
- Total dist/: *[TODO]* KB

== Comparación con desarrollo

*[TODO: Comparar tamaño de archivos entre dev y prod]*

= Publicación

== Repositorio en GitHub

*Estructura del repositorio*:

```
hhyc2-pec1/
├── .github/
│   └── copilot-instructions.md
├── dist/                    # Build de producción
├── docs/                    # Documentación Typst
├── src/                     # Código fuente
├── .editorconfig
├── .gitignore
├── .prettierrc
├── .stylelintrc.json
├── package.json
├── README.md
└── vite.config.js (si aplica)
```

*URL del repositorio*: `[TODO: Añadir URL de GitHub]`

== Deployment en Netlify

*[TODO: Documentar el proceso de deployment en Netlify]*

=== Configuración del deployment

1. Conectar repositorio GitHub con Netlify
2. Configurar build settings:
   - Build command: `npm run build`
   - Publish directory: `dist`
3. Configurar variables de entorno (si aplica)
4. Activar Continuous Deployment

=== URL pública

*URL de producción*: `[TODO: Añadir URL de Netlify]`

=== Verificación

*[TODO: Capturas de pantalla del sitio desplegado]*

Se verificó que:
- ✅ El sitio es accesible públicamente
- ✅ Todos los assets se cargan correctamente
- ✅ El diseño responsive funciona
- ✅ No hay errores en la consola del navegador
- ✅ Performance es adecuada (Lighthouse: *[TODO]*)

= Decisiones adicionales de diseño y desarrollo

*[TODO: Documentar cualquier otra decisión importante que tomaras]*

== Dependencias externas añadidas

*[TODO: ¿Añadiste FontAwesome u otra librería? Documentar]*

== Accesibilidad

*[TODO: Documentar consideraciones de accesibilidad]*

Se aplicaron las siguientes prácticas de accesibilidad:

- HTML semántico (`<header>`, `<nav>`, `<main>`, `<article>`, `<footer>`)
- Atributos ARIA donde necesario
- Contraste de colores adecuado (mínimo AA)
- Foco visible en elementos interactivos
- Alt text en todas las imágenes
- Estructura de headings lógica

== Optimizaciones de performance

*[TODO: Documentar optimizaciones aplicadas]*

- Lazy loading de imágenes
- Optimización de imágenes con Sharp
- Minificación de assets
- Tree shaking de JavaScript
- CSS crítico inline (si aplica)

= Conclusiones

*[TODO: Escribir conclusiones finales]*

== Objetivos alcanzados

Este proyecto ha permitido:

1. *Implementar un workflow moderno*: Vite, Sass, PostCSS, Stylelint, Prettier
2. *Aplicar metodología BEM*: Nomenclatura consistente en todos los componentes
3. *Dominar herramientas de calidad*: Stylelint con reglas personalizadas
4. *Utilizar características avanzadas de Sass*: Variables, funciones, mixins, parciales
5. *Desarrollar diseño responsive*: Mobile-first, breakpoints con custom media
6. *Publicar profesionalmente*: GitHub + Netlify con continuous deployment

== Aprendizajes clave

*[TODO: Reflexionar sobre lo aprendido]*

Los principales aprendizajes fueron:

- La importancia de una metodología CSS estructurada para mantenibilidad
- Cómo configurar herramientas de linting para enforcar convenciones
- Las ventajas de CSS moderno (custom properties, nesting, funciones de color)
- El valor de automatización mediante bundlers y build tools
- Workflow profesional de desarrollo frontend

== Retos encontrados y soluciones

*[TODO: Documentar problemas y cómo los resolviste]*

Principales desafíos:

1. *[TODO: Problema 1]*: Solución aplicada...
2. *[TODO: Problema 2]*: Solución aplicada...

== Posibles mejoras futuras

*[TODO: Ideas para mejorar el proyecto]*

Áreas de mejora identificadas:

- Implementar testing visual (Percy, Chromatic)
- Añadir pre-commit hooks con Husky
- Mejorar accesibilidad con testing automatizado (axe-core)
- Implementar Service Worker para offline support
- Añadir analytics y monitoreo de performance

#bibliography("./references.bib")
