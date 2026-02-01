# Development Environment Setup

This document covers the dependencies, tools, and environment setup required for developing the TokenTransmogTooltips addon.

## Development Dependencies

### World of Warcraft API Documentation

This addon runs in the WoW client and uses **Lua 5.1** with WoW-specific APIs. API documentation generated from the game client(s) can be found in the [wow-ui-source](https://github.com/Gethe/wow-ui-source) git repository, which should be cloned at `../wow-ui-source` (relative to this project).

**Repository Location**: `../wow-ui-source` (one directory up from this project)

#### Branch Strategy

This addon is **retail-only** at the moment, so we must use one of the following branches in wow-ui-source:
- `live` - Current retail client
- `ptr` - Public Test Realm (upcoming patch testing)
- `ptr2` - Secondary PTR (when multiple patches are in testing)
- `beta` - Beta client (expansion/major patch testing)

**CRITICAL WORKFLOW REQUIREMENT**: The first step in any workflow should be to verify that wow-ui-source is on a valid branch and up to date.

**If the branch is acceptable** (one of: live/ptr/ptr2/beta):
1. Ensure the branch is up to date with `git fetch` and check for unpulled commits
2. If commits need to be pulled, **halt immediately** and notify the user:
   - State the current branch name
   - Mention that there are commits to pull down
   - Wait for confirmation before proceeding
3. If the branch is up to date, mention which version/branch is being referenced for API validation (e.g., "Referencing wow-ui-source `live` branch for API validation") so the user can verify it's correct

**If the branch is not acceptable**:
1. Halt immediately
2. Notify the user of the current branch
3. Request they checkout a valid retail branch before proceeding

If the user insists on proceeding with stale or incorrect documentation, note that API information may be inaccurate or incomplete.

#### Backwards Compatibility Considerations

When operating on `ptr`, `ptr2`, or `beta` branches, consider backwards compatibility with the `live` branch since users will be running the `live` client until the new patch/expansion goes live.

**Best Practice**: Use existence guards for net-new APIs:
```lua
if C_NewAPI and C_NewAPI.NewFunction then
  -- Use new API
else
  -- Fallback or skip functionality
end
```

**Agent Notification Requirements**:
- When working with pre-release content (`ptr`/`ptr2`/`beta` branches) and operating in code areas that could leverage a new API or were previously using a now-deprecated API, **notify the user** with:
  - The new/deprecated API in question
  - Potential impact on `live` client compatibility
  - Recommended approach (existence guards, alternatives, etc.)

#### Enum Values on Pre-release Branches

When using enum values on `ptr`, `ptr2`, or `beta` branches:
- If an enum value has not been used in this codebase before, treat it as potentially new
- **Notify the user** that a new enum value is being used, including:
  - The enum name and value
  - Where it's being used
  - That it may require compatibility guards for `live` client
- Defer the decision on whether to add guards to the user

#### Deprecated APIs

The wow-ui-source documentation includes files referencing deprecated APIs (usually the file names start with `Deprecated_`). These should be avoided in favor of current APIs whenever possible.

**If you encounter deprecated APIs**:
1. Flag them for review in chat
2. Add a code comment marking them as deprecated
3. Suggest potential replacements if available

**API Reference Rule**: Any references to WoW API functions, enums, or constants should be cross-checked against the wow-ui-source documentation. If an API exists in the documentation, use it instead of creating custom implementations.

### wow-build-tools

This project uses [`McTalian/wow-build-tools`](https://github.com/McTalian/wow-build-tools) for building and packaging the addon.

**Repository Location**: `../wow-build-tools` (one directory up from this project)

**Technology**: Go-based CLI application using Cobra/Viper framework

**Installation**: The tool is expected to be pre-built and available on the system PATH.

**Help Access**: Run `wow-build-tools --help` for usage information

#### Build Tool Features

**Special Comment Markers**:
- `--@alpha@` / `--@end-alpha@`: Debug code blocks (included in development builds, stripped in releases)
- `@project-version@`: Replaced with version from `.toc` file during build

**Common Commands** (via Makefile):
```bash
# Development build with alpha markers included
make build

# Watch mode for live development (rebuilds on file changes)
make watch
```

#### Usage Contexts

- **Local Development**: Primary use case for agent collaboration
- **CI Workflows**: Automated verification, packaging, and release publishing

## Build Environment Setup

### Prerequisites
1. **wow-ui-source** cloned at `../wow-ui-source`
2. **wow-build-tools** cloned at `../wow-build-tools`
3. Valid branch checked out in wow-ui-source (live/ptr/ptr2/beta)

### Makefile Targets

The root [Makefile](../../Makefile) provides convenient aliases for common wow-build-tools commands:

- `make build` - Development build with alpha features
- `make watch` - Continuous build on file changes
- Additional targets TBD (check Makefile for current list)

## Environment Verification Checklist

Before starting any workflow, verify:
- [ ] wow-ui-source exists at `../wow-ui-source`
- [ ] wow-ui-source is on a valid retail branch (live/ptr/ptr2/beta)
- [ ] wow-ui-source branch is up to date (no unpulled commits)
- [ ] wow-build-tools exists at `../wow-build-tools` and is available on PATH
- [ ] Makefile targets are accessible from project root

## Future Considerations

The following items are noted for potential future enhancements but are not currently required:

- **API Version Cross-Reference**: Comparing `.toc` file's `## Interface: XXXXX` with wow-ui-source branch to ensure version compatibility
