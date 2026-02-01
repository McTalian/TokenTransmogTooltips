---
applyTo: '**'
---

# Project Standards and Conventions

This document outlines the specific standards and conventions used in the TokenTransmogTooltips addon project. Adhering to these guidelines ensures code quality, consistency, and maintainability.

## Path Separators

Always use forward slashes (`/`) for file paths in this project (generally seen in XML files). The WoW client correctly interprets forward slashes regardless of the underlying OS.

## Trailing Commas

When defining tables in Lua, **always include a trailing comma after the last item**. This practice minimizes diffs when new items are added later.

**Example**:
```lua
local myTable = {
  item1 = value1,
  item2 = value2,
  item3 = value3,  -- Trailing comma required
}
```

For single-element arrays where the element must remain wrapped in a table (not unpacked):
```lua
local appearances = {
  [appearanceID] = { modID, },  -- Trailing comma prevents unpacking
}
```

## Semicolons

This project **does not use semicolons (`;`)** to terminate statements in Lua files.

## Simplicity vs. Cleverness

While there's a time and a place for clever code, **prioritize simplicity and readability** in this project. The goal is to make it easy for both human developers and AI agents to understand and maintain the codebase.

## Commenting and Language Server Annotations

When adding new logic, **include comments that explain the purpose and functionality** of the code. Focus on the "why" rather than the "what" when the code itself is clear.

For complex logic or WoW API usage, provide context about:
- Why this approach was chosen
- Any limitations or edge cases
- References to WoW API documentation when relevant

## Library Dependencies

Currently, the addon **does not rely on any external libraries**. When adding new functionality, prefer native Lua and WoW API functions over third-party libraries unless absolutely necessary.

If there is a significant benefit to using a library:
1. Document the reasoning in code comments
2. Inform the user via chat
3. Ensure the library is compatible with WoW's Lua 5.1 environment
4. Consider the maintenance burden and compatibility across WoW patches

## Code Organization

### Namespace Usage

The addon uses WoW's standard namespace pattern:
```lua
local addonName, ns = ...
```

All addon data is stored in the `ns` (namespace) table to avoid global pollution.

### Table Structure

When building data structures:
- Use local variables for frequently accessed subtables
- Reference the namespace for assignments that other files need to access
- Keep nesting levels reasonable for readability

**Example**:
```lua
local addonName, ns = ...
local gear = ns._Gear.RaidName  -- Local reference for brevity

ns._Gear.RaidName.TOKENGROUP = {
  ["DIFFICULTY"] = {
    ["SLOT"] = {
      ["CLASS"] = gear.CLASS["DIFFICULTY"]["SLOT"],
    },
  },
}
```

## Indentation and Formatting

- Use **2 spaces** for indentation (not tabs)
- Align table keys when it improves readability
- Break long lines logically at natural boundaries

## String Quoting

- Use double quotes `"` for string literals by default
- Use single quotes `'` when embedding strings in strings to avoid escaping
- Be consistent within each file

## WoW API Usage

### Enum Values

Always use the named enum constants rather than numeric literals:

**Correct**:
```lua
[Enum.ItemCreationContext.RaidMythic] = data
```

**Incorrect**:
```lua
[6] = data  -- Don't use magic numbers
```

### API Function Calls

- Store complex API results in named local variables
- Check return values for nil before use when appropriate
- Add comments explaining non-obvious API behavior

## XML Files

### Load Order

XML `_index.xml` files define load order. Structure matters:

**Token group `_index.xml`**:
```xml
<Ui xmlns="http://www.blizzard.com/wow/ui/">
  <!-- Classes first (order doesn't matter) -->
  <Script file="class1.lua"/>
  <Script file="class2.lua"/>
  <!-- Aggregator last -->
  <Script file="tokengroup.lua"/>
</Ui>
```

**Raid `_index.xml`**:
```xml
<Ui xmlns="http://www.blizzard.com/wow/ui/">
  <!-- Namespace creation first -->
  <Script file="_index.lua"/>
  <!-- Token groups (order doesn't matter) -->
  <Include file="tokengroup1/_index.xml"/>
  <Include file="tokengroup2/_index.xml"/>
  <!-- Token mapping last -->
  <Script file="tokens.lua"/>
</Ui>
```

### Formatting

- Use consistent indentation (2 spaces)
- Keep opening/closing tags aligned
- Include xmlns attribute on root `<Ui>` element

## Build Markers

### Alpha/Debug Code

Wrap debug-only code in alpha markers:
```lua
--@alpha@
-- Debug tools, verbose logging, etc.
print("Debug: Token registered:", tokenID)
--@end-alpha@
```

This code is included in development builds but stripped from releases by `wow-build-tools`.

### Version Placeholders

Use `@project-version@` in `.toc` files:
```
## Version: @project-version@
```

The build tool replaces this with the actual version during packaging.

## Error Handling

- Validate input data when accepting external values
- Use `assert()` for internal invariants that should never fail
- Log warnings for recoverable issues
- Avoid silent failures - at minimum, print to chat in alpha builds

## Performance Considerations

- Cache expensive API calls when results won't change
- Avoid creating tables in hot paths (tooltip rendering)
- Use local variables for frequently accessed data
- Profile before optimizing - prioritize readability first
