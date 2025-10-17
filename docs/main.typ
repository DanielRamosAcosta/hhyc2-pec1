#import "../../../../../cross/packages/packages/preview/tidbit-uoc/0.1.1/template.typ": template

#show: template.with(
    subject: "Herramientas HTML y CSS II",
    title: "PEC1: Bundlers y automatización web",
    subtitle: "Optimización del flujo de trabajo con herramientas de construcción modernas",
    date: datetime(year: 2025, month: 10, day: 17),
    author: "Daniel Ramos Acosta",
)

= Introducción

= Propuesta de cambio de boilerplate

Para poder realizar algo más de investigación sobre las herramientas, se ha propuesto usar un boilerplate distinto al propuesto en el enunciado de la práctica.

Esto ha sido motivado principalmente por innovación para usar herramientas más modernas a las propuestas (vite es más moderno que parcel), y también porque me permite aprender herramientas que ya se usan en el trabajo.

Se ha validado este cambio con el profesor de la asignatura y se ha aprobado con una correcta justificación.

= Cambio en el boilerplate

== Análisis del boilerplate propuesto

Primero que nada, he revisado qué traía el boilerplate original propuesto por la asignatura:

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

== Boilerplate personalizado

El objetivo es crear un boilerplate similar al propuesto por la asignatura, pero usando vite y cutting edge features.

Otra de las cosas que me gustaría mantener como objetivo, es usar las features modernas de CSS para evitar depender tanto de preprocesadores como Sass/SCSS. Muchas features que antes ofrencían ya están incluidas en el estándar, y son seguras gracias a la compatibilidad que ofrecen herramientas como PostCSS con postcss-preset-env.

=== Paso uno: instalar vite

he instalado vite usando:

```bash
npm create vite@latest
```

#figure(image("images/vite-setup.jpg"), caption: [
    Setup de instalación de vite
])

Se ha elegido la plantilla de vanilla, ya que en esta PEC no vamos a usar ningún framework web como React.

Se han seleccionado opciones por defecto para el resto de opciones.

/*

#lorem(700)

= Imágenes

Un tamaño recomendado es un ancho del 75 % de la línea de texto con una altura
proporcional a la primera. Todas las imágenes deben incluir una leyenda.


#figure(image("assets/logo.svg"), caption: [
    Leyenda de la figura.
])

= Código

Ejemplo de código.

#figure(caption: [Ejemplo de código.])[
    ```python
    def OrdenBurbuja(a):
        for i in range(len(a)-2):
            for j in range(len(a)-i-1):
                if a[j] > a[j+1]:
                    a[j],a[j+1] = a[j+1],a[j]
        return a
    ```
]

= Bibliografía y citas

La bibliografía debe incluirse mediante un archivo `.bib` con el mismo nombre que el archivo principal. El estilo bibliográfico a usar es APA séptima edición. Para las citas puede utilizar los siguientes comandos según sea adecuado:

- Cita completa entre paréntesis: #cite(<Bib06>)
- Cita completa sin paréntesis: #cite(<Bib06>, form: "prose")
- Cita de autor: #cite(<Bib06>, form: "author")
- Cita de año: #cite(<Bib06>, form: "year")
- Cita con opciones extras: #cite(<Bib06>, form: "full")

#bibliography("./references/example.bib")
*/