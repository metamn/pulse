// Figure preloading
//
//
//
// Styleguide figure-preloading
@mixin figure--preloading($placeholder-color) {
  @include background-image($placeholder-color, not-stretched);
  background-image: url("{{ site.url }}{{ site.images }}spinner.svg");
}
