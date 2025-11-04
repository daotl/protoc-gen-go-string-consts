# protoc-gen-go-string-consts

This plugin for the Protocol Buffers compiler (`protoc`) generates Go string constants for enum values defined in `.proto` files.

Options:

```proto
extend google.protobuf.EnumOptions {
  // Enable generation of Go string constants for this enum. (Default: false)
  bool generate_go_string_consts = 91700;
  // Strip the specified prefix from the generated Go string constant names.
  string generate_go_string_consts_strip_name_prefix = 91701;
  // Strip the specified prefix from the generated Go string constant values, (Default: "{{enum_name}}_")
  // By default, the string constant value is the same as the name.
  string generate_go_string_consts_strip_value_prefix = 91702;
  // Add string prefix to generated Go string constant names.
  string generate_go_string_consts_name_prefix = 91703;
  // Add string suffix to generated Go string constant names.
  string generate_go_string_consts_name_suffix = 91704;
  // Add string prefix to generated Go string constant values.
  string generate_go_string_consts_value_prefix = 91705;
  // Add string suffix to generated Go string constant values.
  string generate_go_string_consts_value_suffix = 91706;
}
```

Example:
```proto
package tests;

import "daotl/protoc-gen-go-string-consts/ext.proto";
option go_package = "github.com/daotl/protoc-gen-go-string-consts/testproto";

enum FOO {
  option (daotl.proto.generate_go_string_consts) = true;
  option (daotl.proto.generate_go_string_consts_value_prefix) = "Prefix";
  option (daotl.proto.generate_go_string_consts_value_suffix) = "Suffix";

  FOO_A = 0;
  FOO_B = 1;
}

enum BAR {
  option (daotl.proto.generate_go_string_consts) = true;
  option (daotl.proto.generate_go_string_consts_strip_name_prefix) = "BAR_";
  option (daotl.proto.generate_go_string_consts_strip_value_prefix) = "";
  option (daotl.proto.generate_go_string_consts_name_prefix) = "Prefix";
  option (daotl.proto.generate_go_string_consts_name_suffix) = "Suffix";

  BAR_A = 0;
  BAR_B = 1;
}
```

Generated Go code:
```go
const FOO_A = "PrefixASuffix"
const FOO_B = "PrefixBSuffix"

const PreifxASuffix = "BAR_A"
const PrefixBSuffix = "BAR_B"
```
