package js.phantomjs;
import js.phantomjs.WebPage;
/**
  A class with some utility functions to bootstrap haxe std lib into a given
  page.
 **/

class PhantomTools {

    /**
      Injects the currently executing phantomjs script into a webkit page.
      Returns the return value from page.injectJs.
     **/
    public static function injectThis(page:WebPage){
        return page.injectJs(System.args[0]);
    }

    /**
      Simple routine which detects if it is being evaluated in webkit.
      Note: The page must first be injected with injectThis.
     **/
    inline public static function inPhantom(){
        return untyped window.hasOwnProperty('phantom');
    }
}
