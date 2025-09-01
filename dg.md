# Developer Guide

## Jekyll Asciidoc Plugin

The [Jekyll Asciidoc Plugin](https://github.com/asciidoctor/jekyll-asciidoc) is used to converts AsciiDoc source files to HTML pages using Asciidoctor. Follow the instruction 
given in the linked page to install and config the plugin.

### Preview images in Visual Source Code

Currently, there is no known better way to preview images in AsciiDoc files in Visual Source code. The workaround is to set different `imagesdir` attributes for the AsciiDoc extension of Visual Source Code and the Jekyll Asciidoc Plugin.

For the AsciiDoc extension of Visual Source Code, add the following attribute to workspace settings:

```
"asciidoc.preview.asciidoctorAttributes": {
  "imagesdir": "${workspaceFolder}"
}
```

For the Jekyll Asciidoc Plugin, add the following to `_config.yml`:

```
asciidoctor:
  attributes:
    imagesdir: "/"
```

Now, in a AsciiDoc file, you can insert an [image macro](https://docs.asciidoctor.org/asciidoc/latest/macros/images-directory/
) like this:

```
image::assets/images/2025/lofoten-faroe/undersea-tunnels-in-the-faroe-islands/undersea-tunnels-map.webp[法罗群岛的海底隧道地图]
```

Because the image macro' target is a relative path, the value of `imagesdir` is added to the target path, making the image macro works for both the Visual Studio Code and the Jekyll Asciidoc Plugin.

The issue of the workround is that we can't use `imagesdir` in an AsciiDoc file to define the common path in all the image macros in the file.

## Site Structure Overview

The content of the website is organized using the following facilities supported by Jekyll:

* Jekyll Pages
* Jekyll Collections
* Jekyll Posts

### Jekyll Pages

A few of Jwkyll [pages](https://jekyllrb.com/docs/pages/) serve as the entry points to the site content.

* `index.md`
* `_pages/trips.html`
* `_pages/posts.md`
* `_pages/about.md`

The home page is created as the `index.md` file in the root directory; while the other pages under the `_pages` directory in order to keep the root directory tidy up.

The `_pages` directory is specified in the `_config.yml` file by using `include` [configuration option](https://jekyllrb.com/docs/configuration/options/).

All pages are written with front matter and rendered to output HTML files on build.

## Trips

Trips is one of the collections that organizes the site content by journeys and itineraries.

### The Jekyll page for trips

The `_pages/trips.html` file defines the Jekyll page with front matter. The page displays a header and a collection of items, each for a trip. 

The `_pages/trips.html` file is also declared as one of the header pages in the `_config.yml` file as below:

```yaml
header_pages:
  - _pages/trips.html
```

All header pages are displayed as top-level menu items in the navigation bar of the site. See the `_includes/header.html` file for details.

### The Jekyll collection for trips

All trip items are defined by the `.md` files in the `_trips` directory, with front matter as the metadata and a paragraph of content as the desription. The `_trips` directory is declared as a collection in the `_config.yml` file as below:

```yaml
collections:
  trips:
    output: true
```

### The page layout for trips

All  `.md` files in the `_trips` directory will be output as `.html` files. The page layout is defined in the `_layouts/trip.html` file. The `layout` is declared as an attribute in front matter of the `.md` files.  

### The sitemap item for trips

In the `sitemap.xml` file, there is an entry for the trips page:

```xml
<url>
    <loc>https://lilyroger.com/trips</loc>
    <lastmod>{{ latest_modified_date | date: "%Y-%m-%d" }}</lastmod>
    <changefreq>weekly</changefreq>
</url>
```

## Images

### Hero Images

Hero images are used at the top of collection pages with a 16:9 aspect ratio and 1920 x 1080 pixels.

## TODOs

* Add [giscus](https://giscus.app) comments to Github Pages.