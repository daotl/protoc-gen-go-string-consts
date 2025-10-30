# protoc-gen-go-string-consts

This plugin for the Protocol Buffers compiler (`protoc`) generates Go string constants for enum values defined in `.proto` files.

Options:

```proto
extend google.protobuf.EnumOptions {
  // Enable generation of Go string constants for this enum. (Default: false)
  bool generate_go_string_consts = 91700;
  // Strip the specified prefix from the generated Go string constant names. (Default: false)
  bool generate_go_string_consts_strip_name_prefix = 91701;
  // Strip the specified prefix from the generated Go string constant values. (Default: true)
  bool generate_go_string_consts_strip_value_prefix = 91702;
}
```

Example:
```proto
enum FOO {
  option (daotl.generate_go_string_consts) = true;
  FOO_A = 0;
  FOO_B = 1;
}

enum BAR {
  option (daotl.generate_go_string_consts) = true;
  option (daotl.generate_go_string_consts_strip_name_prefix) = true;
  option (daotl.generate_go_string_consts_strip_value_prefix) = false;
  BAR_A = 0;
  BAR_B = 1;
}
```

Generated Go code:
```go
const FOO_A = "A"
const FOO_B = "B"

const A = "BAR_A"
const B = "BAR_B"
```
