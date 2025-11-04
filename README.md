# protoc-gen-go-string-consts

This plugin for the Protocol Buffers compiler (`protoc`) generates Go string constants for enum values defined in `.proto` files.

Options:

```sh
protoc --go-string-consts_out=. \
--go-string-consts_opt=paths=source_relative \
--go-string-consts_opt=include_nested=true
```

Enum options:

```proto
extend google.protobuf.EnumOptions {
  // Enable generation of Go string constants for this enum. (Default: false)
  bool gen_go_string_consts = 91700;
  // Strip the specified prefix from the generated Go string constant names.
  string gen_go_string_consts_strip_name_prefix = 91701;
  // If true convert string const name into PascalCase
  // (apply before `gen_go_string_consts_name_prefix` and `gen_go_string_consts_name_suffix`).
  bool gen_go_string_consts_name_pascal_case = 91702;
  // If true convert string const name into CAPS_CASE
  // (apply before `gen_go_string_consts_name_prefix` and `gen_go_string_consts_name_suffix`).
  // Can't be used together with gen_go_string_consts_name_pascal_case.
  bool gen_go_string_consts_name_caps_case = 91703;
  // Add string prefix to generated Go string constant names.
  string gen_go_string_consts_name_prefix = 91704;
  // Add string suffix to generated Go string constant names.
  string gen_go_string_consts_name_suffix = 91705;
  // Strip the specified prefix from the generated Go string constant values, (Default: "{{enum_name}}_")
  // By default, the string constant value is the same as the name.
  string gen_go_string_consts_strip_value_prefix = 91706;
  // Add string prefix to generated Go string constant values.
  string gen_go_string_consts_value_prefix = 91707;
  // Add string suffix to generated Go string constant values.
  string gen_go_string_consts_value_suffix = 91708;
}
```

See `testproto/test.proto` for examples.
