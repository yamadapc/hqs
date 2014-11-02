hqs
===============================================================================
Patched QueryString encoding, since the built in version from `network` doesn't
work properly.

I haven't really gotten around this. It needs a lot more complexity, since
currently it's a really simple and non-general implementation (though it works -
I think).

I'll make it generalized for all `mono-traversable` instances which have
elements convertible to `Ints` hopefully, soon. Maybe this is a dead-end; I
don't know.

## License
This code is licensed under the MIT license for Pedro Tacla Yamada. For more
information, please refer to the [LICENSE](/LICENSE) file.
