# swift-pose-gallery `gh-pages`

## Documentation

[Docs](http://alexcurylo.github.io/swift-pose-gallery/) generated with [jazzy](https://github.com/realm/jazzy). Hosted by [GitHub Pages](https://pages.github.com).

## Setup

The `gh-pages` branch includes `develop` as a [git submodule](http://git-scm.com/book/en/v2/Git-Tools-Submodules) in order to generate docs.

````bash
$ git clone https://github.com/alexcurylo/swift-pose-gallery.git
$ cd swift-pose-gallery/
$ git checkout gh-pages
$ git submodule init
$ git submodule update
````

## Generate

````bash
$ ./build_docs.sh
````

## Preview

````bash
$ open index.html -a Safari
````

## Publish

````bash
$ ./publish_docs.sh
````

## Acknowledgements

Thanks to [@jesse_squires](https://twitter.com/jesse_squires) for jazzy demonstrations in projects such as [JSQCoreDataKit](https://github.com/jessesquires/JSQCoreDataKit/tree/gh-pages)!
