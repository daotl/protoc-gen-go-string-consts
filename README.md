# protoc-gen-go-string-consts

This plugin for the Protocol Buffers compiler (`protoc`) generates Go string constants for enum values defined in `.proto` files.

Options:

```proto
extend google.protobuf.EnumOptions {
  // Enable generation of Go string constants for this enum. (Default: false)
  bool gen_go_string_consts = 91700;
  // Strip the specified prefix from the generated Go string constant names.
  string gen_go_string_consts_strip_name_prefix = 91701;
    // Turn string const name from snake case into pascal case (apply before `gen_go_string_consts_name_prefix` and `gen_go_string_consts_name_suffix`).
  bool gen_go_string_consts_name_pascal_case = 91702;
  // Add string prefix to generated Go string constant names.
  string gen_go_string_consts_name_prefix = 91703;
  // Add string suffix to generated Go string constant names.
  string gen_go_string_consts_name_suffix = 91704;
  // Strip the specified prefix from the generated Go string constant values, (Default: "{{enum_name}}_")
  // By default, the string constant value is the same as the name.
  string gen_go_string_consts_strip_value_prefix = 91705;
  // Add string prefix to generated Go string constant values.
  string gen_go_string_consts_value_prefix = 91706;
  // Add string suffix to generated Go string constant values.
  string gen_go_string_consts_value_suffix = 91707;
}
```

Example:
```proto
import "daotl/protoc-gen-go-string-consts/ext.proto";

enum FOO {
  option (daotl.proto.gen_go_string_consts) = true;
  option (daotl.proto.gen_go_string_consts_value_prefix) = "Prefix";
  option (daotl.proto.gen_go_string_consts_value_suffix) = "Suffix";

  FOO_A = 0;
  FOO_B = 1;
}

enum BAR {
  option (daotl.proto.gen_go_string_consts) = true;
  option (daotl.proto.gen_go_string_consts_strip_name_prefix) = "BAR_";
  option (daotl.proto.gen_go_string_consts_strip_value_prefix) = "";
  option (daotl.proto.gen_go_string_consts_name_prefix) = "Prefix";
  option (daotl.proto.gen_go_string_consts_name_suffix) = "Suffix";

  BAR_A = 0;
  BAR_B = 1;
}

enum OpCode {
  option (daotl.proto.gen_go_string_consts) = true;
  option (daotl.proto.gen_go_string_consts_strip_name_prefix) = "OP_CODE_";
  option (daotl.proto.gen_go_string_consts_strip_value_prefix) = "OP_CODE_";
  option (daotl.proto.gen_go_string_consts_name_pascal_case) = true;
  option (daotl.proto.gen_go_string_consts_name_prefix) = "OpCode";
  option (daotl.proto.gen_go_string_consts_value_prefix) = "OC_";
  OP_CODE_RESERVED = 0;
  OP_CODE_RESOLUTION = 1;
  OP_CODE_GET_SITEINFO = 2;

  OP_CODE_CREATE_ID = 100;
  OP_CODE_DELETE_ID = 101;
  OP_CODE_ADD_ELEMENT = 102;
  OP_CODE_REMOVE_ELEMENT = 103;
  OP_CODE_MODIFY_ELEMENT = 104;
  OP_CODE_LIST_IDS = 105;
  OP_CODE_LIST_DERIVED_PREFIXES = 106;

  OP_CODE_CHALLENGE_RESPONSE = 200;
  OP_CODE_VERIFY_RESPONSE = 201;
  OP_CODE_HOME_PREFIX = 300;
  OP_CODE_UNHOME_PREFIX = 301;
  OP_CODE_LIST_HOMED_PREFIXES = 302;

  OP_CODE_SESSION_SETUP = 400;
  OP_CODE_SESSION_TERMINATE = 401;
}
```

Generated Go code:
```go
// Generated string constants for enums

// String constants for enum tests.FOO
const FOO_A = "PrefixASuffix"
const FOO_B = "PrefixBSuffix"

// String constants for enum tests.BAR
const PrefixASuffix = "BAR_A"
const PrefixBSuffix = "BAR_B"

// String constants for enum tests.OpCode
const OpCodeReserved = "OC_RESERVED"
const OpCodeResolution = "OC_RESOLUTION"
const OpCodeGetSiteinfo = "OC_GET_SITEINFO"
const OpCodeCreateId = "OC_CREATE_ID"
const OpCodeDeleteId = "OC_DELETE_ID"
const OpCodeAddElement = "OC_ADD_ELEMENT"
const OpCodeRemoveElement = "OC_REMOVE_ELEMENT"
const OpCodeModifyElement = "OC_MODIFY_ELEMENT"
const OpCodeListIds = "OC_LIST_IDS"
const OpCodeListDerivedPrefixes = "OC_LIST_DERIVED_PREFIXES"
const OpCodeChallengeResponse = "OC_CHALLENGE_RESPONSE"
const OpCodeVerifyResponse = "OC_VERIFY_RESPONSE"
const OpCodeHomePrefix = "OC_HOME_PREFIX"
const OpCodeUnhomePrefix = "OC_UNHOME_PREFIX"
const OpCodeListHomedPrefixes = "OC_LIST_HOMED_PREFIXES"
const OpCodeSessionSetup = "OC_SESSION_SETUP"
const OpCodeSessionTerminate = "OC_SESSION_TERMINATE"
```
