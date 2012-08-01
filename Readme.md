phantomjs-hx
============

phantomjs-hx is a [haxe](http://www.haxe.org) extern for
[phantomjs](http://phantomjs.org/).

It contains typedefs and externs for all of the common modules and entities.
It also contains the PhantomTools class, which enable some Haxe-specific
functionality.

For now,  PhantomTools lets you more easily work with Webpage.evaluate.
See more information on the [phantomjs
   api](http://code.google.com/p/phantomjs/wiki/Interface#evaluate(function\)).

Webpage.evaluate() accepts a callback that executes locally in a new virtual
browser instance. This page instance is separate from the phantomjs instance,
so none of the scoped variables are avaialble.  Naturally, this virtual
instance will not have the Haxe standard lib, such as trace, Hash, etc.

PhantomTools provides "injectThis" which will inject the current script into
the page, which will provide all of the haxe libraries for the evaluated page:

```javascript
var page = WebPage.create();
PhantomTools.injectThis(page);
```
The scope, however, will still not be available.

It is also necessary to prevent the phantomjs script from executing its static
main function in the evaluated page. You can check the result from
PhantomTools.inPhantom() to avoid running main() in an evaluated page:

```javascript
static function main(){
  if (!PhantomTools.inPhantom()) return;
  //[...]
```

Note
----
The require("webpage").create() syntax is not used to create phantomjs objects
(e.g. WebPages).  Instead, you can simply use  the "create" method for the
class. (e.g. WebPage.create()), which conforms to Haxe syntax, and aliases the
correct js code.
