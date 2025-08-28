# Developer Guide

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

